import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/profile_card.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/screen/donor_profiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProfile extends StatelessWidget {
  const SingleProfile({
    super.key,
    required this.title,
    required this.stream1,
    required this.stream2,
    required this.stream3,
    required this.stream4,
  });

  final String title;
  final Stream<List<DocumentSnapshot<Object?>>> stream1;
  final Stream<List<DocumentSnapshot<Object?>>> stream2;
  final Stream<List<DocumentSnapshot<Object?>>> stream3;
  final Stream<List<DocumentSnapshot<Object?>>> stream4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(23.61 * 1, 0 * 1, 23.94 * 1, 32 * 1),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 10 * 1),
            child: Text(
              title,
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.25,
                color: const Color(0xff12183a),
              ),
            ),
          ),
          SizedBox(
            height: 88.14,
            width: double.maxFinite,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardData(stream: stream1),
                CardData(stream: stream2),
                CardData(stream: stream3),
                CardData(stream: stream4),
              ],
            ),
          )
          // Container(
          //   margin: EdgeInsets.all(2.0),
          // height:   88.4,
          //   width: double.maxFinite,
          //   child: ListView.builder(itemBuilder: (context,index){
          //     List<Stream<List<DocumentSnapshot<Object?>>>>  listOfStream = [
          //       stream1,
          //       stream2,
          //       stream3,
          //       stream4,
          //     ];
          //   return  CardData(stream: listOfStream[index],);
          //   }),
          // ),
        ],
      ),
    );
  }
}

class CardData extends StatelessWidget {
  const CardData({
    super.key,
    required this.stream,
  });

  final Stream<List<DocumentSnapshot<Object?>>> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data!.isEmpty ||
            snapshot.data.isBlank!) {
          return SizedBox.shrink();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // return SizedBox(
            //   height: 88.14,
            //   width: 100.14,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: snapshot.data!.map((docSnapshot) {
            //       Map<String, dynamic> userData = docSnapshot
            //           .data() as Map<String, dynamic>;
            final userData = snapshot.data;
            Map<String, dynamic> cardData =
                userData!.first.data() as Map<String, dynamic>;
            //                     snapshot.data!.map((docSnapshot) {
            // userData = docSnapshot
            //     .data() as Map<String, dynamic>;});
            return SizedBox(
              height: 88.14,
              width: 100.14,
              child: ProfileCard(
                imgURL: cardData[IMAGEURL][0],
                label: cardData[CATEGORY],
              ),
              // );
              //   }).toList(),
              // ),
            );
          }
        }
      },
    );
  }
}
