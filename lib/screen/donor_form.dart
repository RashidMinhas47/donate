import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/custom_Text.dart';
import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Constant/sized_box.dart';
import 'package:feedonations/Constant/snackbar.dart';
import 'package:feedonations/Provider/homescreen_provider.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/json/donor_form_data.dart';
import 'package:feedonations/screen/home_screen.dart';
import 'package:feedonations/services/notification_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../Components/d&r_text_field.dart';

class DonorForm extends StatefulWidget {
  const DonorForm({super.key, required this.getCateGory});
  final String getCateGory;

  @override
  State<DonorForm> createState() => _DonorFormState();
}

class _DonorFormState extends State<DonorForm> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  Future<void> sendNotificationToAllUsers() async {
    //Retrive all document from collection
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(USERS).get();
    //Iterate for each document
    snapshot.docs.forEach((doc) async{
      //Cast doc.data() to Map<String,dynamic>
      final Map<String,dynamic> data  = doc.data() as Map<String,dynamic>;
      // Check if the document has the notification field
      if(data.containsKey(NOTIFICATION_TOKEN)){
        AdminNotificationServices().pushNotification(title: "The new Donor is arrived", body: "A product is donated by someone", token: data[NOTIFICATION_TOKEN]);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider =
        Provider.of<HomeScreenProvider>(context);

    Future<void> _showImagePickerDialog(BuildContext context, index) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Image'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: const Text('Gallery'),
                    onTap: () {
                      // homeScreenProvider.selectImageAt(
                      //     ImageSource.gallery, context, index);
                      // Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    child: const Text('Camera'),
                    onTap: () {
                      // homeScreenProvider.selectImageAt(
                      //     ImageSource.camera, context, index);
                      // Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    child: const Text('Remove Image'),
                    onTap: () {
                      // homeScreenProvider.removeImageAt(context, index);
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }


    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            // iphone14plus3xhT (16:75)
            width: double.infinity,
            decoration: BoxDecoration(
              color:const Color(0xffffffff),
              borderRadius: BorderRadius.circular(30 * 1),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding:const EdgeInsets.only(top: 40, bottom: 20),
                  child: SizedBox(
                    width: 150 * 1,
                    height: 30 * 1,
                    child: Text(
                      'Donner form',
                      style: GoogleFonts.quicksand(
                        fontSize: 24 * 1,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * 1 / 1,
                        color: kTitleColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 490 + 40,
                  child: ListView.builder(
                    itemCount: donorFormData.length,
                    itemBuilder: (context, index) => DRFormTextField(
                      title: donorFormData[index][TITLE],
                      iconUrl: donorFormData[index][IMAGEURL],
                      hintText: donorFormData[index][HINTTEXT],
                      controller: controllers.elementAt(index),
                    ),
                  ),
                ),
                Container(
                  // group10000039338K7 (28:11)
                  margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        // incomecertificatevoucher3ws (28:13)
                        child: Text(
                          'Upload Product Pictures',
                          style: GoogleFonts.quicksand(
                              fontSize: 20 * 1,
                              fontWeight: FontWeight.w600,
                              height: 1.25 * 1 / 1,
                              color: kTitleColor),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Icon(Icons.image),
                      //     Icon(Icons.image),
                      //     Icon(Icons.image),
                      //   ],
                      // )
                      //TODO: just for while I'm changing it

                      // InkWell(
                      //   onTap: () {
                      //     _showImagePickerDialog(context, index);
                      //   },
                      //   child: Container(
                      //     // group1000003928Mhf (28:14)
                      //     width: 90.6 * 1,
                      //     height: 90.66 * 1,
                      //     child: Icon(
                      //       Icons.image,
                      //       color: Color.fromARGB(255, 0, 59, 107),
                      //       size: 90,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.center,
                        height: homeScreenProvider.imageFiles.isEmpty? 40 :170,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [

                            GridView.builder(
                              gridDelegate:
                                const  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // Adjust the number of images per row as needed
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                              ),
                              itemCount: homeScreenProvider.imageFiles.length,
                              itemBuilder: (context, index) {
                                if(homeScreenProvider.imageFiles.isEmpty){
                                 return const SizedBox.shrink();
                                }else {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    homeScreenProvider.imageFiles[index],
                                    fit: BoxFit.cover,

                                  ),
                                );}
                              },
                            ),
                           homeScreenProvider.imageFiles.length== 1? IconButton(

                              onPressed: () async {
                                await homeScreenProvider.selectMultiImages(
                                    ImageSource.gallery, context);
                              },
                              icon:const Icon(Icons.add_a_photo,color: kPrimaryColor,size: 40,),
                            ): ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                fixedSize:const Size(140,30,),
                              ),
                              onPressed: () async {
                                await homeScreenProvider.selectMultiImages(
                                    ImageSource.gallery, context);
                              },
                              child: Text('Select Images',style: GoogleFonts.poppins(color: Colors.white),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controllers.isNotEmpty) {
                      homeScreenProvider.sendDonorData(
                          category: widget.getCateGory,
                          context: context,
                          nameController: controllers.elementAt(0),
                          cnicCont: controllers.elementAt(1),
                          addressCont: controllers.elementAt(2),
                          mobileCont: controllers.elementAt(3),
                          descriptionCont: controllers.elementAt(4));
                      // sendNotificationToAllUsers();
                    } else {
                      AppSnackBar.snackBar(
                          context, "Some error on text fields");
                    }
                  },
                  child: Container(
                    // frame1000003918DUy (29:31)
                    margin: EdgeInsets.fromLTRB(80, 30, 80, 20),
                    width: double.infinity,
                    height: 53 * 1,
                    decoration: BoxDecoration(
                      color: Color(0xff2a81bf),
                      borderRadius: BorderRadius.circular(4 * 1),
                    ),
                    child: Center(
                      child: Text(
                        'DONATE',
                        style: GoogleFonts.quicksand(
                          fontSize: 20 * 1,
                          fontWeight: FontWeight.w500,
                          height: 1.25 * 1 / 1,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          homeScreenProvider.dataIsUploading
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
                          color: kPrimaryColor, size: 30)),
                )
              : SizedBox.shrink()
        ],
      )),
    );
  }
}

// class PickImageAt extends StatelessWidget {
//   const PickImageAt(
//       {super.key,
//       required this.homeScreenProvider,
//       required this.onPressed,
//       required this.index});
//   final HomeScreenProvider homeScreenProvider;
//   final VoidCallback onPressed;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return homeScreenProvider.sourceImage.isNotEmpty &&
//             homeScreenProvider.sourceImage.elementAt(index) != null
//         ? CupertinoButton(
//             onPressed: onPressed,
//             child: SizedBox(
//                 height: 90,
//                 width: 90,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.file(
//                       homeScreenProvider.sourceImage.elementAt(index)!,
//                       fit: BoxFit.fill,
//                     ))),
//           )
//         : CupertinoButton(
//             onPressed: onPressed,
//             child: SizedBox(
//               height: 190,
//               width: MediaQuery.of(context).size.width * 0.2,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white54,
//                   borderRadius: BorderRadius.circular(22),
//                 ),
//                 width: 100,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(AppImages().galleryImg),
//                     10.ph,
//                     const CustomText(
//                       text: "From Gallery",
//                       fontWeight: FontWeight.w400,
//                       textSize: 14,
//                       color: Colors.black,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }
// }
