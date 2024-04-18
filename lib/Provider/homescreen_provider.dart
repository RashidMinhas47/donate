import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Constant/bottom_navigation.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Constant/snackbar.dart';
import 'package:feedonations/screen/app_nav_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../Routes/routes.dart';

class HomeScreenProvider with ChangeNotifier {
  bool isLoading = false;
  bool dataIsUploading = false;
  String? selectedPayment = "";

  List<String> items = [
    "University",
    "College",
    "School",
    "Others",
  ];

  String? selectedValue;

  // Widget myDropDown() {
  //   return CustomDropdownButton2(
  //       offset: const Offset(220, 20),
  //       buttonHeight: 50,
  //       buttonDecoration: BoxDecoration(
  //         border: const Border.fromBorderSide(
  //           BorderSide(color: Colors.black),
  //         ),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       icon: const Icon(
  //         Icons.arrow_drop_down,
  //         size: 25,
  //       ),
  //       hint: 'Select the institute',
  //       dropdownItems: items,
  //       value: selectedValue,
  //       onChanged: (value) {
  //         selectedValue = value;
  //         notifyListeners();
  //       });
  // }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? _profilePic;
  File? get profilePic => _profilePic;

  List<File> _imageFiles = [];
  // final List<File> _recieverImageFiles = [];

  List<File> get imageFiles => _imageFiles;
  // List<File> get recieImageFiles => _recieverImageFiles;

  Future<void> selectMultiImages(
      ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      _imageFiles
          .addAll(pickedImages.map((pickedImage) => File(pickedImage.path)));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No Images Selected")));
    }
  }

  Future<void> selectMultiImagesReceiver(
      ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      _imageFiles
          .addAll(pickedImages.map((pickedImage) => File(pickedImage.path)));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No Images Selected")));
    }
  }

  Future<void> removeImage(context) async {
    if (_profilePic != null) {
      await _profilePic!.delete();
      _profilePic = null;
      AppSnackBar.snackBar(context, "Image removed");
      notifyListeners();
    }
  }

  // Future<void> removeImageAt(context, index) async {
  //   if (imageFiles.elementAt(index) != null) {
  //     await imageFiles.elementAt(index)!.delete();
  //     // imageFiles = null;
  //     AppSnackBar.snackBar(context, "Image removed");
  //     notifyListeners();
  //   }
  // }

  // Future<void> selectImage(ImageSource source, BuildContext context) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);
  //   if (pickedImage != null) {
  //     _profilePic = File(pickedImage.path);
  //     notifyListeners();
  //   } else {
  //     AppSnackBar.snackBar(context, "No Image Selected");
  //   }
  // }

  // Future<void> selectImageAt(
  //     ImageSource source, BuildContext context, index) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);
  //   //TODO: The first task has been done the next will contineo tommorow
  //   if (pickedImage != null) {
  //     imageFiles.insert(index, File(pickedImage.path));
  //     print(
  //         "................THESE IMAGES.............. $imageFiles..............AND LENGTH IS:");
  //     notifyListeners();
  //   } else {
  //     AppSnackBar.snackBar(context, "No Image Selected");
  //   }
  // }

  void sendDonorData({
    required TextEditingController nameController,
    required TextEditingController cnicCont,
    required BuildContext context,
    required TextEditingController addressCont,
    required TextEditingController mobileCont,
    required TextEditingController descriptionCont,
    required String category,
  }) async {
    Timestamp timestamp = Timestamp.now();
    isLoading = true;
    showBottomNavigationBar = false;
    notifyListeners();
    if (nameController.text.isNotEmpty &&
        addressCont.text.isNotEmpty &&
        mobileCont.text.isNotEmpty &&
        imageFiles != null) {
      dataIsUploading = true;

      // Future<List<String>> uploadImagesToFirebase() async {
      List<String> imageUrls = [];
      try {
        for (int i = 0; i < _imageFiles.length; i++) {
          File imageFile = _imageFiles[i];
          String fileName =
              imageFile.path.split('/').last; // Get the file name from the path
          Reference firebaseStorageRef =
              FirebaseStorage.instance.ref().child(const Uuid().v1());
          UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();
          imageUrls.add(downloadUrl);
          print("UPLOADED IMAGES ARE $imageFiles");
        }
      } catch (e) {
        print("Error uploading images: $e");
      }
      //   return imageUrls;
      // }

      // UploadTask uploadTask = FirebaseStorage.instance
      //     .ref()
      //     .child(selectedValue.toString())
      //     .child(const Uuid().v1())
      //     .putFile(profilePic!);
      // TaskSnapshot taskSnapshot = await uploadTask;
      // String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      Map<String, dynamic> newUserData = {
        NAME: nameController.text,
        TIMESTAMP: timestamp,
        CNIC: cnicCont.text,
        IMAGEURL: imageUrls,
        ADDRESS: addressCont.text,
        MOBILE: mobileCont.text,
        DESCRIPTION: descriptionCont.text,
        CATEGORY: category,
      };
      print(
          "........YOUR.......DESIRED...DATA.........$newUserData...............");
      _firestore
          .collection(REQUESTS)
          .doc(category)
          .collection(DONORREQUESTS)
          .add(newUserData);
      final recentPost = _firestore.collection("RecentPost");
      if (sendDataToAnotherCollections == true) {
        recentPost.add(newUserData);
      }

      isLoading = true;
      _profilePic = null;
      selectedValue = null;
      addressCont.clear();
      nameController.clear();
      descriptionCont.clear();
      mobileCont.clear();
      cnicCont.clear();
      nameController.clear();
      notifyListeners();
      AppSnackBar.snackBar(context, "Post Successful Done");
      isLoading = false;
      showBottomNavigationBar = true;
      // notifyListeners();
      RoutingPage.gotoNextPage(context: context, gotoNextPage: AppNavBar());
      dataIsUploading = false;
      _imageFiles = [];
    } else {
      AppSnackBar.snackBar(context, "Check All the Details ");
      isLoading = false;
      dataIsUploading = false;

      showBottomNavigationBar = true;
      // notifyListeners();
    }
    notifyListeners();
  }

  void sendReceiverData(
      {required TextEditingController nameController,
      required TextEditingController cnicCont,
      context,
      // required int index,
      required TextEditingController addressCont,
      required TextEditingController mobileCont,
      required TextEditingController emailCont,
      required TextEditingController fatherOcuCont,
      required String category,
      required TextEditingController descriptionCont}) async {
    Timestamp timestamp = Timestamp.now();
    isLoading = true;
    showBottomNavigationBar = false;
    notifyListeners();
    if (nameController.text.isNotEmpty &&
        cnicCont.text.isNotEmpty &&
        addressCont.text.isNotEmpty &&
        emailCont.text.isNotEmpty &&
        mobileCont.text.isNotEmpty &&
        category != null &&
        imageFiles != null) {
      // UploadTask uploadTask = FirebaseStorage.instance
      //     .ref()
      //     .child(selectedValue.toString())
      //     .child(const Uuid().v1())
      //     .putFile(profilePic!);
      List<String> imageUrls = [];
      try {
        for (int i = 0; i < _imageFiles.length; i++) {
          File imageFile = _imageFiles[i];
          String fileName =
              imageFile.path.split('/').last; // Get the file name from the path
          Reference firebaseStorageRef =
              FirebaseStorage.instance.ref().child(const Uuid().v1());
          UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();
          imageUrls.add(downloadUrl);
          print("UPLOADED IMAGES ARE $imageFile");
        }
      } catch (e) {
        print("Error uploading images: $e");
      }

      // TaskSnapshot taskSnapshot = await uploadTask;
      // String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      Map<String, dynamic> newUserData = {
        NAME: nameController.text,
        TIMESTAMP: timestamp,
        CNIC: cnicCont.text,
        IMAGEURL: imageUrls,
        ADDRESS: addressCont.text,
        MOBILE: mobileCont.text,
        EMAIL: emailCont.text,
        FATHEROCCUPATION: fatherOcuCont.text,
        DESCRIPTION: descriptionCont.text,
        CATEGORY: category,
      };
      _firestore
          .collection(REQUESTS)
          .doc(category)
          .collection(RECEIVERREQUESTS)
          .add(newUserData);
      final recentPost = _firestore.collection("RecentPost");
      if (sendDataToAnotherCollections == true) {
        recentPost.add(newUserData);
      }

      isLoading = true;
      _profilePic = null;
      selectedValue = null;
      addressCont.clear();
      nameController.clear();
      descriptionCont.clear();
      mobileCont.clear();
      cnicCont.clear();
      nameController.clear();
      AppSnackBar.snackBar(context, "Post Successful Done");
      isLoading = false;
      showBottomNavigationBar = true;
      notifyListeners();
      RoutingPage.gotoNextPage(context: context, gotoNextPage: AppNavBar());
    } else {
      AppSnackBar.snackBar(context, "Check All the Details ");
      isLoading = false;
      showBottomNavigationBar = true;
      notifyListeners();
    }
    notifyListeners();
  }

  bool sendDataToAnotherCollections = false;

  bool _showBottomNavigationBar = true;

  bool get showBottomNavigationBar => _showBottomNavigationBar;

  set showBottomNavigationBar(bool value) {
    _showBottomNavigationBar = value;
    notifyListeners();
  }

  void showPaymentDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("JazzCash"),
                onTap: () {
                  setSelectedOption(context, "JazzCash");
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('GooglePay'),
                onTap: () {
                  setSelectedOption(context, "GooglePay");
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _selectedOption = '';
  String get selectedOption => _selectedOption;

  setSelectedOption(context, String option) {
    _selectedOption = option;
    notifyListeners();
  }
}
