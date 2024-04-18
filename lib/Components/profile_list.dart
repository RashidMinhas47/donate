import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/profile_card.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilesList extends StatelessWidget {
  const ProfilesList({
    super.key,
    required this.title,
    required this.stream,
  });
  final String title;
  final Stream<List<DocumentSnapshot<Object?>>>? stream;
  // final NullableIndexedWidgetBuilder itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Container(
      // group1000003906Kx1 (12:245)
      margin: const EdgeInsets.fromLTRB(23.61 * 1, 0 * 1, 23.94 * 1, 32 * 1),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // receiverprofilesToK (11:70)
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
          Container(
            // group1000003927nah (18:937)
            width: double.infinity,
            height: 88.15 * 1,

            child: StreamBuilder<List<DocumentSnapshot>>(
              stream: stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                } else {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Container(
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Create a card widget to display each item of data
                          Map<String, dynamic> userData = snapshot.data![index]
                              .data() as Map<String, dynamic>;
                          print(userData);
                          return ProfileCard(
                              imgURL: userData[IMAGEURL][0],
                              label: userData[CATEGORY]);
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
