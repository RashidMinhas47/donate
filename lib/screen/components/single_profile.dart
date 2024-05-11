import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/profile_card.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    required this.stream1, required this.stream2, required this.stream3, required this.stream4,
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
            width: double.maxFinite,
            height: 88.15 * 1,
            child:

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               stream1.first.isBlank! ?SizedBox(height: 0,width: 0,): Container(
                    height: 88.14,
                    width: 88.14,
                    child: StreamBuilder<List<DocumentSnapshot>>(
                      stream: stream1,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }else if(snapshot.data!.isEmpty|| snapshot.data.isBlank!){
                          return SizedBox.shrink();
                        }  else {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data!.map((docSnapshot) {
                                  Map<String, dynamic> userData = docSnapshot
                                      .data() as Map<String, dynamic>;
                                  return ProfileCard(
                                    imgURL: userData[IMAGEURL][0],
                                    label: userData[CATEGORY],
                                  );
                                }).toList(),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
               // stream2.first.isBlank! ?SizedBox.shrink(): Container(
               //      height: 88.14,
               //      width: 88.14,
               //      child: StreamBuilder<List<DocumentSnapshot>>(
               //        stream: stream2,
               //        builder: (BuildContext context,
               //            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
               //          if (snapshot.connectionState ==
               //              ConnectionState.waiting) {
               //            return const CircularProgressIndicator();
               //          } else {
               //            if (snapshot.hasError) {
               //              return Text('Error: ${snapshot.error}');
               //            } else {
               //              return SizedBox(
               //                width: double.infinity,
               //                child: ListView(
               //                  scrollDirection: Axis.horizontal,
               //                  children: snapshot.data!.map((docSnapshot) {
               //                    Map<String, dynamic> userData = docSnapshot
               //                        .data() as Map<String, dynamic>;
               //                    return ProfileCard(
               //                      imgURL: userData[IMAGEURL][0],
               //                      label: userData[CATEGORY],
               //                    );
               //                  }).toList(),
               //                ),
               //              );
               //            }
               //          }
               //        },
               //      ),
               //    ),
               // stream3.first.isBlank! ?SizedBox.shrink(): Container(
               //      height: 88.14,
               //      width: 88.14,
               //      child: StreamBuilder<List<DocumentSnapshot>>(
               //        stream: stream3,
               //        builder: (BuildContext context,
               //            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
               //          if (snapshot.connectionState ==
               //              ConnectionState.waiting) {
               //            return const CircularProgressIndicator();
               //          } else {
               //            if (snapshot.hasError) {
               //              return Text('Error: ${snapshot.error}');
               //            } else {
               //              return SizedBox(
               //                width: double.infinity,
               //                child: ListView(
               //                  scrollDirection: Axis.horizontal,
               //                  children: snapshot.data!.map((docSnapshot) {
               //                    Map<String, dynamic> userData = docSnapshot
               //                        .data() as Map<String, dynamic>;
               //                    return ProfileCard(
               //                      imgURL: userData[IMAGEURL][0],
               //                      label: userData[CATEGORY],
               //                    );
               //                  }).toList(),
               //                ),
               //              );
               //            }
               //          }
               //        },
               //      ),
               //    ),
               //
               stream4.first.isBlank! ?SizedBox.shrink(): Container(
                    height: 88.14,
                    width: 88.14,
                    child: StreamBuilder<List<DocumentSnapshot>>(
                      stream: stream4,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data!.map((docSnapshot) {
                                  Map<String, dynamic> userData = docSnapshot
                                      .data() as Map<String, dynamic>;
                                  return ProfileCard(
                                    imgURL: userData[IMAGEURL][0],
                                    label: userData[CATEGORY],
                                  );
                                }).toList(),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}