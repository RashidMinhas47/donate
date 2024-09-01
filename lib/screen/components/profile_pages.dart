import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/screen/components/profile_detailed_tile.dart';
import 'package:feedonations/screen/components/receiver_profile_details_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constant/constants.dart';
import 'donor_profile_detailed_card.dart';

class DonorProfilePage extends StatelessWidget {
  const DonorProfilePage({super.key, required this.stream});
  final Stream<List<DocumentSnapshot>> stream;
//
//   @override
//   State<EducationProfilePage> createState() => _EducationProfilePageState();
// }
//
// class _EducationProfilePageState extends State<EducationProfilePage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data!.isEmpty || snapshot.data.isBlank!) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.category,
                  size: 120,
                  color: Color(0x7E9E9E9E),
                ),
                Text(
                  "No item is available",
                  style: GoogleFonts.poppins(
                      fontSize: 28, color: const Color(0x7E9E9E9E)),
                )
              ],
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final userData = snapshot.data;
                Map<String, dynamic> cardData =
                    userData![index].data() as Map<String, dynamic>;
                return Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      // showDialog(context: context, builder: (context)=>SizedBox(
                      //   height:double.maxFinite,width: double.maxFinite,
                      //   child: Container(
                      //     margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20),
                      //       color: Colors.white
                      //     ),
                      //   ),
                      // ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleDonorProfileDetailedCard(
                                    cardData: cardData,
                                  )));
                    },
                    child: ProfileDetailedCard(
                      name: cardData[NAME],
                      address: cardData[ADDRESS],
                      donated: "7k PKR",
                      profession: "Business man",
                      imageUrl: cardData[IMAGEURL][0],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            );
          }
        }
      },
    );
  }
}

class ReceiverProfilePage extends StatelessWidget {
  const ReceiverProfilePage({super.key, required this.stream});
  final Stream<List<DocumentSnapshot>> stream;
//
//   @override
//   State<EducationProfilePage> createState() => _EducationProfilePageState();
// }
//
// class _EducationProfilePageState extends State<EducationProfilePage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data!.isEmpty || snapshot.data.isBlank!) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.category,
                  size: 120,
                  color: Color(0x7E9E9E9E),
                ),
                Text(
                  "No item is available",
                  style: GoogleFonts.poppins(
                      fontSize: 28, color: const Color(0x7E9E9E9E)),
                )
              ],
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final userData = snapshot.data;
                Map<String, dynamic> cardData =
                    userData![index].data() as Map<String, dynamic>;
                return Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      // showDialog(context: context, builder: (context)=>SizedBox(
                      //   height:double.maxFinite,width: double.maxFinite,
                      //   child: Container(
                      //     margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20),
                      //       color: Colors.white
                      //     ),
                      //   ),
                      // ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleReceiverProfileDetailedCard(
                                    cardData: cardData,
                                  )));
                    },
                    child: ProfileDetailedCard(
                      name: cardData[NAME],
                      address: cardData[ADDRESS],
                      donated: "7k PKR",
                      profession: "Business man",
                      imageUrl: cardData[IMAGEURL][0],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            );
          }
        }
      },
    );
  }
}
