import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/category_list.dart';
import 'package:feedonations/Components/home_app_bar.dart';
import 'package:feedonations/Components/profile_card.dart';
import 'package:feedonations/Components/search_card_field.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/screen/components/single_profile.dart';
import 'package:feedonations/services/notification_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/profile_list.dart';
import 'components/slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Stream<List<DocumentSnapshot>>> allReceiverData = [];
  List<Stream<List<DocumentSnapshot>>> allDonorData = [];

  // Stream<List<DocumentSnapshot>> fetchDonorData() {
  //   return FirebaseFirestore.instance
  //       .collection(REQUESTS)
  //       .doc(EDUCATION)
  //       .collection(DONORREQUESTS)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs);
  // }

  // Stream<List<DocumentSnapshot>> fetchAllReceiverData() {
  //   // Create a stream controller to emit the combined data
  //   StreamController<List<DocumentSnapshot>> controller =
  //       StreamController<List<DocumentSnapshot>>();
  //
  //   // Fetch data from each collection and add it to the stream controller
  //   fetchReceiverData(EDUCATION).listen((data) {
  //     controller.add(data);
  //   });
  //   fetchReceiverData(MEDICAL).listen((data) {
  //     controller.add(data);
  //   });
  //   fetchReceiverData(WISH).listen((data) {
  //     controller.add(data);
  //   });
  //   fetchReceiverData(MORE).listen((data) {
  //     controller.add(data);
  //   });
  //
  //   // Close the stream controller when done
  //   controller.close();
  //
  //   // Return the stream from the controller
  //   return controller.stream;
  // }

  Stream<List<DocumentSnapshot>> fetchReceiverData(String docId) {
    return FirebaseFirestore.instance
        .collection(REQUESTS)
        .doc(docId)
        .collection(RECEIVERREQUESTS)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  Stream<List<DocumentSnapshot>> fetchDonorData(String docId) {
    return FirebaseFirestore.instance
        .collection(REQUESTS)
        .doc(docId)
        .collection(DONORREQUESTS)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  // Stream<List<DocumentSnapshot>> fetchRecieverData() {
  //   return FirebaseFirestore.instance
  //       .collection(REQUESTS)
  //       .doc(EDUCATION)
  //       .collection(RECEIVERREQUESTS)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs);
  // }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<QueryDocumentSnapshot> allData = [];
  List<QueryDocumentSnapshot> searchResults = [];
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    // fetchAllData();
    // fetchDonorData();
    allReceiverData.add(fetchReceiverData(EDUCATION));
    allReceiverData.add(fetchReceiverData(MEDICAL));
    allReceiverData.add(fetchReceiverData(WISH));
    allReceiverData.add(fetchReceiverData(MORE));
    allDonorData.add(fetchDonorData(EDUCATION));
    allDonorData.add(fetchDonorData(MEDICAL));
    allDonorData.add(fetchDonorData(WISH));
    allDonorData.add(fetchDonorData(MORE));
  }

  ///Recent Data From university Collection
  // Future<void> fetchAllData() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
  //       .collection(REQUESTS)
  //       .doc(EDUCATION)
  //       .collection(DONORREQUESTS)
  //       .orderBy("timestamp", descending: true)
  //       .get();
  //
  //   setState(() {
  //     allData = snapshot.docs;
  //   });
  // }

  // Future<List<QueryDocumentSnapshot>> alphabetSearch(String searchTerm) async {
  //   List<QueryDocumentSnapshot> results = [];
  //
  //   searchTerm = searchTerm.toLowerCase();
  //
  //   results = allData
  //       .where((docSnapshot) =>
  //           docSnapshot.get('name').toLowerCase().startsWith(searchTerm))
  //       .toList();
  //
  //   return results;
  // }

  // void performAlphabetSearch(String searchTerm) async {
  //   List<QueryDocumentSnapshot> results = await alphabetSearch(searchTerm);
  //
  //   setState(() {
  //     searchResults = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          // iphone14plus2si5 (11:53)
          padding: const EdgeInsets.fromLTRB(0.39, 13.5, 0, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xfff6f7f9),
            borderRadius: BorderRadius.circular(40),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopAppBar(),
                SearchCardField(size: size),
                const CategoriesList(),
                SingleProfile(
                  title: "Receiver Profiles",
                  stream1: fetchReceiverData(EDUCATION),
                  stream2: fetchReceiverData(MEDICAL),
                  stream3: fetchReceiverData(WISH),
                  stream4: fetchReceiverData(MORE),
                ),
                SingleProfile(
                  title: "Donor Profiles",
                  stream1: fetchDonorData(EDUCATION),
                  stream2: fetchDonorData(MEDICAL),
                  stream3: fetchDonorData(WISH),
                  stream4: fetchDonorData(MORE),
                ),
                SliderWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

