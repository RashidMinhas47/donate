import 'dart:ui';

import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/screen/views/donor%20last%20view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constant/constants.dart';

class SingleDonorProfileDetailedCard extends StatelessWidget {
  const SingleDonorProfileDetailedCard(
      {super.key,
      // required this.name, required this.cnic, required this.address, required this.email, required this.occupation, required this.age, required this.description,
      required this.cardData});
  // final String name,cnic,address,email,occupation,age,description;
  final Map<String, dynamic> cardData;
  void showGlassMorphismPopup(BuildContext context,Size size) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Blurred Background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: size.width* 0.74,
                  height: size.height* 0.24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.8),

                  ),
                ),
              ),
              // Glassmorphism Box

              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: size.width* 0.74,
                  height: size.height* 0.24,
                  decoration: BoxDecoration(
                    color: Color(0xFF2A81BF).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20.0),
                    // border: Border.all(
                    //   color: Colors.white.withOpacity(0.2),
                    //   width: 1.5,
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cardData[NAME],
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 18,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(color: kPrimaryColor.withOpacity(0.3),thickness: 1, indent: size.width*0.2,endIndent: size.width*0.2,),
                          Text(
                            cardData[CNIC],
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 18,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(color: kPrimaryColor.withOpacity(0.3),thickness: 1, indent: size.width*0.2,endIndent: size.width*0.2,),
                          Text(
                            cardData[ADDRESS],
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 18,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(color: kPrimaryColor.withOpacity(0.3),thickness: 1, indent: size.width*0.2,endIndent: size.width*0.2,),

                          Text(
                            cardData[MOBILE],
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 18,

                            ),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Get it',
          style: GoogleFonts.getFont(
            'Quicksand',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: const Color(0xFF12183A),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 12.9, 0, 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 74),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 32.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0.9, 0, 0, 16.2),
                            child: Text(
                              'Product pictures',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xFF12183A),
                              ),
                            ),
                          ),
                          Container(
                              height: 100,
                              width: double.maxFinite,
                              margin: const EdgeInsets.fromLTRB(0.2, 0, 0, 0),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cardData[IMAGEURL].length,
                                  itemBuilder: (context, index) => Container(
                                        height: 100,
                                        width: 100,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 20, 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFFFFFFF),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x14000000),
                                              offset: Offset(0, 2),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            cardData[IMAGEURL][index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ))
                              ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10.8, 0, 10.8, 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0.8, 5),
                            child: Text(
                              'Product description',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xFF12183A),
                              ),
                            ),
                          ),
                          Text(
                            cardData[DESCRIPTION],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              color: const Color(0xFF3B3B3B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0.3, 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              'Donor name',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xFF12183A),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10.3, 0, 8.9, 0),
                            child: Text(
                              cardData[NAME],
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                height: 1.5,
                                color: const Color(0xFF3B3B3B),
                                decorationColor: const Color(0xFF3B3B3B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0.1, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              'location',
                              style: GoogleFonts.getFont(
                                'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xFF12183A),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10.4, 0, 10.4, 0),
                            child: Text(
                              cardData[ADDRESS],
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                height: 1.5,
                                color: const Color(0xFF3B3B3B),
                                decorationColor: const Color(0xFF3B3B3B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(style: TextButton.styleFrom(
                  fixedSize: Size(size.width*0.49,size.height*0.07),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.9)),
                  backgroundColor: const Color(0xFF2A81BF),
                ), onPressed: ()=> showGlassMorphismPopup(context,size), child: Text(
                  'SEND DETAILS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:feedonations/Constant/color_scheme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../Constant/constants.dart';
//
// class SingleDonorProfileDetailedCard extends StatelessWidget {
//   const SingleDonorProfileDetailedCard(
//       {super.key,
//         // required this.name, required this.cnic, required this.address, required this.email, required this.occupation, required this.age, required this.description,
//         required this.cardData});
//   // final String name,cnic,address,email,occupation,age,description;
//   final Map<String, dynamic> cardData;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           'Donate it',
//           style: GoogleFonts.quicksand(
//             fontWeight: FontWeight.w700,
//             fontSize: 24,
//             color: const Color(0xFF12183A),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFFFFFFFF),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(0, 12.9, 0, 0.2),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.fromLTRB(24, 0, 23, 16),
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 1, 0),
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: const Color(0xFFE2E2E2)),
//                           borderRadius: BorderRadius.circular(30),
//                           color: const Color(0xFFFFFFFF),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Color(0x1A000000),
//                               offset: Offset(0, 5),
//                               blurRadius: 8,
//                             ),
//                           ],
//                         ),
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: Container(
//                             padding: const EdgeInsets.fromLTRB(35, 7, 34, 17),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 0.2, 14),
//                                   child: Text(
//                                     cardData[NAME],
//                                     style: GoogleFonts.quicksand(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: const Color(0xFF565656),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(height: 1,color: kGreyColor,),
//                                 Container(
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 0.6, 12),
//                                   child: Text(
//                                     cardData[CNIC],
//                                     style: GoogleFonts.quicksand(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: const Color(0xFF565656),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(height: 1,color: kGreyColor,),
//                                 Container(
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 1.7, 16),
//                                   child: Text(
//                                     cardData[ADDRESS],
//                                     style: GoogleFonts.quicksand(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: const Color(0xFF565656),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(height: 1,color: kGreyColor,),
//                                 Container(
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 1, 14),
//                                   child: Text(
//                                     cardData[EMAIL],
//                                     style: GoogleFonts.quicksand(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: const Color(0xFF565656),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(height: 1,color: kGreyColor,),
//                                 Container(
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 1.8, 14),
//                                   child: Text(
//                                     cardData[FATHEROCCUPATION],
//                                     style: GoogleFonts.quicksand(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: const Color(0xFF565656),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(height: 1,color: kGreyColor,),
//                                 Container(
//                                   margin:
//                                   const EdgeInsets.fromLTRB(0, 0, 0.8, 14),
//                                   child: Text(
//                                     "not defined",
//                                     style: GoogleFonts.quicksand(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: const Color(0xFF565656),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(height: 1,color: kGreyColor,),
//                                 Text(
//                                   cardData[DESCRIPTION],
//                                   textAlign: TextAlign.center,
//                                   style: GoogleFonts.quicksand(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 16,
//                                     height: 1.8,
//                                     color: const Color(0xFF565656),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         top: 34,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFE2E2E2),
//                           ),
//                           child: const SizedBox(
//                             width: 381,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         top: 68,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFE2E2E2),
//                           ),
//                           child: const SizedBox(
//                             width: 381,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         top: 102,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFE2E2E2),
//                           ),
//                           child: const SizedBox(
//                             width: 381,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         top: 136,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFE2E2E2),
//                           ),
//                           child: const SizedBox(
//                             width: 381,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFE2E2E2),
//                           ),
//                           child: const SizedBox(
//                             width: 381,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         bottom: 135,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFE2E2E2),
//                           ),
//                           child: const SizedBox(
//                             width: 381,
//                             height: 0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(24, 0, 24, 36),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 0, 34.1),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Container(
//                           child: Text(
//                             'Income certificate & voucher',
//                             style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 20,
//                               color: const Color(0xFF12183A),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0.2, 0, 0, 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               margin: const EdgeInsets.fromLTRB(0, 0, 27.5, 0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: const Color(0xFFFFFFFF),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Color(0x14000000),
//                                     offset: Offset(0, 2),
//                                     blurRadius: 4,
//                                   ),
//                                 ],
//                               ),
//                               child: Container(
//                                 height: 90.9,
//                                 padding: const EdgeInsets.fromLTRB(
//                                     0, 36.1, 6.8, 40.7),
//                                 child: SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: SizedBox(
//                                     width: 16,
//                                     height: 14,
//                                     child: SvgPicture.network(
//                                       'assets/vectors/icon_11_x2.svg',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: const EdgeInsets.fromLTRB(0, 0, 27.5, 0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: const Color(0xFFFFFFFF),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Color(0x14000000),
//                                     offset: Offset(0, 2),
//                                     blurRadius: 4,
//                                   ),
//                                 ],
//                               ),
//                               child: Container(
//                                 height: 90.9,
//                                 padding: const EdgeInsets.fromLTRB(
//                                     0, 36.1, 8.2, 40.7),
//                                 child: SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: SizedBox(
//                                     width: 16,
//                                     height: 14,
//                                     child: SvgPicture.network(
//                                       'assets/vectors/icon_47_x2.svg',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: const Color(0xFFFFFFFF),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Color(0x14000000),
//                                     offset: Offset(0, 2),
//                                     blurRadius: 4,
//                                   ),
//                                 ],
//                               ),
//                               child: Container(
//                                 height: 90.9,
//                                 padding: const EdgeInsets.fromLTRB(
//                                     0, 36.1, 7.6, 40.7),
//                                 child: SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: SizedBox(
//                                     width: 16,
//                                     height: 14,
//                                     child: SvgPicture.network(
//                                       'assets/vectors/icon_220_x2.svg',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 29),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF2A81BF),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Container(
//                       width: 203,
//                       padding: const EdgeInsets.fromLTRB(0, 14, 0.9, 14),
//                       child: Text(
//                         'send it',
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.quicksand(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20,
//                           color: const Color(0xFFFFFFFF),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
