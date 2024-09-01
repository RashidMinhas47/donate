import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Constant/snackbar.dart';
import 'package:feedonations/Provider/homescreen_provider.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/json/receiver_form_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../Components/d&r_text_field.dart';
import '../Constant/constants.dart';
import '../json/donor_form_data.dart';

class ReceiverForm extends StatefulWidget {
  const ReceiverForm({super.key, required this.getCategory});
  final String getCategory;
  @override
  State<ReceiverForm> createState() => _ReceiverFormState();
}

class _ReceiverFormState extends State<ReceiverForm> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<HomeScreenProvider>(context).dispose();
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
              // iphone14plus4Q4V (27:108)
              padding: const EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 0.2 * 1),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(30 * 1),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // iphone14plus3xhT (16:75)
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(30 * 1),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 20),
                          child: SizedBox(
                            height: 30 * 1,
                            child: Text(
                              'Receiver',
                              style: GoogleFonts.quicksand(
                                fontSize: 24 * 1,
                                fontWeight: FontWeight.w700,
                                height: 1.25 * 1 / 1,
                                color: kTitleColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 730,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: receiverFormData.length,
                            itemBuilder: (context, index) => DRFormTextField(
                              title: receiverFormData[index][TITLE],
                              iconUrl: receiverFormData[index][IMAGEURL],
                              hintText: receiverFormData[index][HINTTEXT],
                              controller: controllers.elementAt(index),
                            ),
                          ),
                        ),
                        Container(
                          // group10000039338K7 (28:11)
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Income certificate & voucher',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20 * 1,
                                    fontWeight: FontWeight.w600,
                                    height: 1.25 * 1 / 1,
                                    color: kTitleColor),
                              ),
                              // Row(
                              //   children: [
                              //     Icon(Icons.image),
                              //     Icon(Icons.image),
                              //     Icon(Icons.image),
                              //   ],
                              // )
                              Stack(
                                alignment: Alignment.center,
                                children: [

                                  Container(
                                    height: homeScreenProvider.imageFiles.isEmpty? 0 :150,

                                    child: GridView.builder(
                                      padding: EdgeInsets.all(0),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            3, // Adjust the number of images per row as needed
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,
                                      ),
                                      itemCount: homeScreenProvider
                                          .imageFiles.length,
                                      itemBuilder: (context, index) {
                                       if(homeScreenProvider.imageFiles.isNotEmpty){
                                         return Image.file(
                                           homeScreenProvider
                                               .imageFiles[index],
                                           fit: BoxFit.cover,
                                         );
                                       }else{
                                         return const SizedBox.shrink();
                                       }
                                      },
                                    ),
                                  ),
                                  homeScreenProvider.imageFiles.length== 1? IconButton(

                                    onPressed: () async {
                                      await homeScreenProvider.selectMultiImages(
                                          ImageSource.gallery, context);
                                    },
                                    icon:const Icon(Icons.add_a_photo,color: kPrimaryColor,size: 40,),
                                  ):     ElevatedButton(
                                    onPressed: () async {
                                      await homeScreenProvider
                                          .selectMultiImagesReceiver(
                                          ImageSource.gallery, context);
                                    },
                                    child: Text('Select Images'),
                                  ),
                                ],
                              ),

                              // Row(
                              //   children: [
                              //     for (int index = 0; index < 3; index++)
                              //       Container(
                              //         // group1000003928Mhf (28:14)
                              //         width: 90.6 * 1,
                              //         height: 90.66 * 1,
                              //         child: Icon(
                              //           Icons.image,
                              //           color: Color.fromARGB(255, 0, 59, 107),
                              //           size: 90,
                              //         ),
                              //       ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controllers.isNotEmpty) {
                              homeScreenProvider.sendReceiverData(
                                context: context,
                                nameController: controllers.elementAt(0),
                                cnicCont: controllers.elementAt(1),
                                addressCont: controllers.elementAt(2),
                                mobileCont: controllers.elementAt(3),
                                emailCont: controllers.elementAt(4),
                                category: widget.getCategory,
                                fatherOcuCont: controllers.elementAt(5),
                                descriptionCont: controllers.elementAt(6),
                              );
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
                                'RECEIVE',
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
                    // Container(
                    //   // autogroupszbtF57 (TgAeYN2opf2KK7sCMqsZbT)
                    //   padding:
                    //       EdgeInsets.fromLTRB(23.61 * 1, 12.87 * 1, 24 * 1, 16 * 1),
                    //   width: double.infinity,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         // frame1000003917Z5o (27:121)
                    //         margin:
                    //             EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0.39 * 1, 29.5 * 1),
                    //         width: double.infinity,
                    //         height: 17 * 1,
                    //         child: Container(
                    //           // group70gRK (27:122)
                    //           width: double.infinity,
                    //           height: double.infinity,
                    //           child: Stack(
                    //             children: [
                    //               Positioned(
                    //                 // group1000003909Rth (27:123)
                    //                 left: 313.9682617188 * 1,
                    //                 top: 1 * 1,
                    //                 child: Container(
                    //                   width: 66.03 * 1,
                    //                   height: 15 * 1,
                    //                   child: Row(
                    //                     crossAxisAlignment: CrossAxisAlignment.center,
                    //                     children: [
                    //                       Container(
                    //                         // vectorj8h (27:124)
                    //                         margin: EdgeInsets.fromLTRB(
                    //                             0 * 1, 0 * 1, 7.03 * 1, 0 * 1),
                    //                         width: 15.06 * 1,
                    //                         height: 15 * 1,
                    //                         child: Image.asset(
                    //                           AppImages.appLogo,
                    //                           width: 15.06 * 1,
                    //                           height: 15 * 1,
                    //                         ),
                    //                       ),
                    //                       Container(
                    //                         // vectorSYu (27:125)
                    //                         margin: EdgeInsets.fromLTRB(
                    //                             0 * 1, 0 * 1, 7.03 * 1, 1 * 1),
                    //                         width: 16.06 * 1,
                    //                         height: 12 * 1,
                    //                         child: Image.asset(
                    //                           AppImages.appLogo,
                    //                           width: 16.06 * 1,
                    //                           height: 12 * 1,
                    //                         ),
                    //                       ),
                    //                       Container(
                    //                         // groupAE1 (27:126)
                    //                         width: 20.85 * 1,
                    //                         height: 9 * 1,
                    //                         child: Image.asset(
                    //                           AppImages.appLogo,
                    //                           width: 20.85 * 1,
                    //                           height: 9 * 1,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Positioned(
                    //                 // VGH (27:130)
                    //                 left: 0 * 1,
                    //                 top: 0 * 1,
                    //                 child: Align(
                    //                   child: SizedBox(
                    //                     width: 30 * 1,
                    //                     height: 17 * 1,
                    //                     child: Text(
                    //                       '9:41',
                    //                       style: GoogleFonts.quicksand(
                    //                         fontSize: 14 * 1,
                    //                         fontWeight: FontWeight.w600,
                    //                         height: 1.2125 * 1 / 1,
                    //                         color: Color(0xff000000),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               Positioned(
                    //                 // frame1000003919AdK (127:6)
                    //                 left: 0 * 1,
                    //                 top: 0 * 1,
                    //                 child: Container(
                    //                   width: 380 * 1,
                    //                   height: 17 * 1,
                    //                   child: Container(
                    //                     // group706Wy (127:7)
                    //                     width: double.infinity,
                    //                     height: double.infinity,
                    //                     child: Row(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.center,
                    //                       children: [
                    //                         Container(
                    //                           // eHb (127:15)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 283.97 * 1, 0 * 1),
                    //                           child: Text(
                    //                             '9:41',
                    //                             style: GoogleFonts.inter(
                    //                               fontSize: 14 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.2125 * 1 / 1,
                    //                               color: Color(0xff000000),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group1000003909A13 (127:8)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 1 * 1, 0 * 1, 1 * 1),
                    //                           height: double.infinity,
                    //                           child: Row(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.center,
                    //                             children: [
                    //                               Container(
                    //                                 // vectortBw (127:9)
                    //                                 margin: EdgeInsets.fromLTRB(0 * 1,
                    //                                     0 * 1, 7.03 * 1, 0 * 1),
                    //                                 width: 15.06 * 1,
                    //                                 height: 15 * 1,
                    //                                 child: Image.asset(
                    //                                   AppImages.appLogo,
                    //                                   width: 15.06 * 1,
                    //                                   height: 15 * 1,
                    //                                 ),
                    //                               ),
                    //                               Container(
                    //                                 // vectorQRB (127:10)
                    //                                 margin: EdgeInsets.fromLTRB(0 * 1,
                    //                                     0 * 1, 7.03 * 1, 1 * 1),
                    //                                 width: 16.06 * 1,
                    //                                 height: 12 * 1,
                    //                                 child: Image.asset(
                    //                                   AppImages.appLogo,
                    //                                   width: 16.06 * 1,
                    //                                   height: 12 * 1,
                    //                                 ),
                    //                               ),
                    //                               Container(
                    //                                 // groupjCZ (127:11)
                    //                                 width: 20.85 * 1,
                    //                                 height: 9 * 1,
                    //                                 child: Image.asset(
                    //                                   AppImages.appLogo,
                    //                                   width: 20.85 * 1,
                    //                                   height: 9 * 1,
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         // autogroupjrwwTuF (TgAeP2y23G7rrszexuJrww)
                    //         margin: EdgeInsets.fromLTRB(
                    //             9.39 * 1, 0 * 1, 107.5 * 1, 16 * 1),
                    //         width: double.infinity,
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               // iconfeathericonschevronleftBqF (151:95)
                    //               margin: EdgeInsets.fromLTRB(
                    //                   0 * 1, 1.26 * 1, 92.5 * 1, 0 * 1),
                    //               width: 6 * 1,
                    //               height: 12 * 1,
                    //               child: Image.asset(
                    //                 AppImages.appLogo,
                    //                 width: 6 * 1,
                    //                 height: 12 * 1,
                    //               ),
                    //             ),
                    //             Text(
                    //               // receiverformgX7 (27:109)
                    //               'Receiver form',
                    //               style: GoogleFonts.quicksand(
                    //                 fontSize: 24 * 1,
                    //                 fontWeight: FontWeight.w700,
                    //                 height: 1.25 * 1 / 1,
                    //                 color: Color(0xf12183a),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         // group1000003963ord (131:1480)
                    //         margin:
                    //             EdgeInsets.fromLTRB(0.39 * 1, 0 * 1, 0 * 1, 16 * 1),
                    //         width: double.infinity,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               // group1000003948YJR (28:10)
                    //               margin: EdgeInsets.fromLTRB(
                    //                   0 * 1, 0 * 1, 0 * 1, 14 * 1),
                    //               width: double.infinity,
                    //               child: Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.center,
                    //                 children: [
                    //                   Container(
                    //                     // group1000003936sLh (27:132)
                    //                     width: double.infinity,
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Container(
                    //                           // namepmj (27:135)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 0 * 1, 3 * 1),
                    //                           child: Text(
                    //                             'Name',
                    //                             style: GoogleFonts.quicksand(
                    //                               fontSize: 16 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.25 * 1 / 1,
                    //                               color: Color(0xf12183a),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group1000003910Yhj (27:133)
                    //                           width: double.infinity,
                    //                           height: 52 * 1,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xffffffff),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(8 * 1),
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Color(0x14000000),
                    //                                 offset: Offset(0 * 1, 4 * 1),
                    //                                 blurRadius: 8 * 1,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Container(
                    //                             // group1000003935dz5 (27:136)
                    //                             width: 152.08 * 1,
                    //                             height: double.infinity,
                    //                             child: Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   // group1000003934Nwf (27:137)
                    //                                   left: 0 * 1,
                    //                                   top: 0 * 1,
                    //                                   child: Container(
                    //                                     padding: EdgeInsets.fromLTRB(
                    //                                         17.68 * 1,
                    //                                         19 * 1,
                    //                                         17.68 * 1,
                    //                                         18 * 1),
                    //                                     width: 49.36 * 1,
                    //                                     height: 52 * 1,
                    //                                     decoration: BoxDecoration(
                    //                                       color: Color(0xffffffff),
                    //                                       borderRadius:
                    //                                           BorderRadius.only(
                    //                                         topLeft: Radius.circular(
                    //                                             8 * 1),
                    //                                         bottomLeft:
                    //                                             Radius.circular(
                    //                                                 8 * 1),
                    //                                       ),
                    //                                     ),
                    //                                     child: Center(
                    //                                       // iconheroiconssolidusereeH (27:139)
                    //                                       child: SizedBox(
                    //                                         width: 14 * 1,
                    //                                         height: 15 * 1,
                    //                                         child: Image.asset(
                    //                                           AppImages.appLogo,
                    //                                           width: 14 * 1,
                    //                                           height: 15 * 1,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   // enteryournamehereAcd (27:141)
                    //                                   left: 47.0834350586 * 1,
                    //                                   top: 21.5 * 1,
                    //                                   child: Align(
                    //                                     child: SizedBox(
                    //                                       width: 105 * 1,
                    //                                       height: 13 * 1,
                    //                                       child: Text(
                    //                                         'enter your name here',
                    //                                         style:
                    //                                             GoogleFonts.quicksand(
                    //                                           fontSize: 10 * 1,
                    //                                           fontWeight:
                    //                                               FontWeight.w600,
                    //                                           height: 1.25 * 1 / 1,
                    //                                           color:
                    //                                               Color(0xff9d9d9d),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 14 * 1,
                    //                   ),
                    //                   Container(
                    //                     // group1000003937cjX (27:142)
                    //                     width: double.infinity,
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Container(
                    //                           // cnicNCu (27:145)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 0 * 1, 3 * 1),
                    //                           child: Text(
                    //                             'CNIC',
                    //                             style: GoogleFonts.quicksand(
                    //                               fontSize: 16 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.25 * 1 / 1,
                    //                               color: Color(0xf12183a),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group100000391068u (27:143)
                    //                           width: double.infinity,
                    //                           height: 52 * 1,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xffffffff),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(8 * 1),
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Color(0x14000000),
                    //                                 offset: Offset(0 * 1, 4 * 1),
                    //                                 blurRadius: 8 * 1,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Container(
                    //                             // group1000003935oZ7 (27:146)
                    //                             width: 152.08 * 1,
                    //                             height: double.infinity,
                    //                             child: Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   // group1000003934Mad (27:147)
                    //                                   left: 0 * 1,
                    //                                   top: 0 * 1,
                    //                                   child: Container(
                    //                                     padding: EdgeInsets.fromLTRB(
                    //                                         17.68 * 1,
                    //                                         19 * 1,
                    //                                         17.68 * 1,
                    //                                         18 * 1),
                    //                                     width: 49.36 * 1,
                    //                                     height: 52 * 1,
                    //                                     decoration: BoxDecoration(
                    //                                       color: Color(0xffffffff),
                    //                                       borderRadius:
                    //                                           BorderRadius.only(
                    //                                         topLeft: Radius.circular(
                    //                                             8 * 1),
                    //                                         bottomLeft:
                    //                                             Radius.circular(
                    //                                                 8 * 1),
                    //                                       ),
                    //                                     ),
                    //                                     child: Center(
                    //                                       // iconheroiconssolidusere3w (27:149)
                    //                                       child: SizedBox(
                    //                                         width: 14 * 1,
                    //                                         height: 15 * 1,
                    //                                         child: Image.asset(
                    //                                           AppImages.appLogo,
                    //                                           width: 14 * 1,
                    //                                           height: 15 * 1,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   // enteryournamehereAY5 (27:151)
                    //                                   left: 47.0834350586 * 1,
                    //                                   top: 21.5 * 1,
                    //                                   child: Align(
                    //                                     child: SizedBox(
                    //                                       width: 105 * 1,
                    //                                       height: 13 * 1,
                    //                                       child: Text(
                    //                                         'enter your name here',
                    //                                         style:
                    //                                             GoogleFonts.quicksand(
                    //                                           fontSize: 10 * 1,
                    //                                           fontWeight:
                    //                                               FontWeight.w600,
                    //                                           height: 1.25 * 1 / 1,
                    //                                           color:
                    //                                               Color(0xff9d9d9d),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 14 * 1,
                    //                   ),
                    //                   Container(
                    //                     // group1000003938dwT (27:152)
                    //                     width: double.infinity,
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Container(
                    //                           // addressCDs (27:155)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 0 * 1, 3 * 1),
                    //                           child: Text(
                    //                             'Address',
                    //                             style: GoogleFonts.quicksand(
                    //                               fontSize: 16 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.25 * 1 / 1,
                    //                               color: Color(0xf12183a),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group10000039107rd (27:153)
                    //                           width: double.infinity,
                    //                           height: 52 * 1,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xffffffff),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(8 * 1),
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Color(0x14000000),
                    //                                 offset: Offset(0 * 1, 4 * 1),
                    //                                 blurRadius: 8 * 1,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Container(
                    //                             // group1000003935da5 (27:156)
                    //                             width: 152.08 * 1,
                    //                             height: double.infinity,
                    //                             child: Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   // group1000003934BLh (27:157)
                    //                                   left: 0 * 1,
                    //                                   top: 0 * 1,
                    //                                   child: Container(
                    //                                     padding: EdgeInsets.fromLTRB(
                    //                                         17.7 * 1,
                    //                                         18.1 * 1,
                    //                                         17.66 * 1,
                    //                                         17 * 1),
                    //                                     width: 49.36 * 1,
                    //                                     height: 52 * 1,
                    //                                     decoration: BoxDecoration(
                    //                                       color: Color(0xffffffff),
                    //                                       borderRadius:
                    //                                           BorderRadius.only(
                    //                                         topLeft: Radius.circular(
                    //                                             8 * 1),
                    //                                         bottomLeft:
                    //                                             Radius.circular(
                    //                                                 8 * 1),
                    //                                       ),
                    //                                     ),
                    //                                     child: Center(
                    //                                       // iconheroiconssolidlocationmark (27:159)
                    //                                       child: SizedBox(
                    //                                         width: 14 * 1,
                    //                                         height: 16.9 * 1,
                    //                                         child: Image.asset(
                    //                                           AppImages.appLogo,
                    //                                           width: 14 * 1,
                    //                                           height: 16.9 * 1,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   // enteryournamehereBED (27:161)
                    //                                   left: 47.0834350586 * 1,
                    //                                   top: 21.5 * 1,
                    //                                   child: Align(
                    //                                     child: SizedBox(
                    //                                       width: 105 * 1,
                    //                                       height: 13 * 1,
                    //                                       child: Text(
                    //                                         'enter your name here',
                    //                                         style:
                    //                                             GoogleFonts.quicksand(
                    //                                           fontSize: 10 * 1,
                    //                                           fontWeight:
                    //                                               FontWeight.w600,
                    //                                           height: 1.25 * 1 / 1,
                    //                                           color:
                    //                                               Color(0xff9d9d9d),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 14 * 1,
                    //                   ),
                    //                   Container(
                    //                     // group1000003939etV (27:162)
                    //                     width: double.infinity,
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Container(
                    //                           // mobile1j3 (27:165)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 0 * 1, 3 * 1),
                    //                           child: Text(
                    //                             'Mobile',
                    //                             style: GoogleFonts.quicksand(
                    //                               fontSize: 16 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.25 * 1 / 1,
                    //                               color: Color(0xf12183a),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group1000003910LWR (27:163)
                    //                           width: double.infinity,
                    //                           height: 52 * 1,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xffffffff),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(8 * 1),
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Color(0x14000000),
                    //                                 offset: Offset(0 * 1, 4 * 1),
                    //                                 blurRadius: 8 * 1,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Container(
                    //                             // group1000003935f2u (27:166)
                    //                             width: 152.08 * 1,
                    //                             height: double.infinity,
                    //                             child: Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   // group1000003934QFP (27:167)
                    //                                   left: 0 * 1,
                    //                                   top: 0 * 1,
                    //                                   child: Container(
                    //                                     padding: EdgeInsets.fromLTRB(
                    //                                         16.7 * 1,
                    //                                         18.1 * 1,
                    //                                         16.66 * 1,
                    //                                         17.9 * 1),
                    //                                     width: 49.36 * 1,
                    //                                     height: 52 * 1,
                    //                                     decoration: BoxDecoration(
                    //                                       color: Color(0xffffffff),
                    //                                       borderRadius:
                    //                                           BorderRadius.only(
                    //                                         topLeft: Radius.circular(
                    //                                             8 * 1),
                    //                                         bottomLeft:
                    //                                             Radius.circular(
                    //                                                 8 * 1),
                    //                                       ),
                    //                                     ),
                    //                                     child: Center(
                    //                                       // iconheroiconssolidphonesuf (27:169)
                    //                                       child: SizedBox(
                    //                                         width: 16 * 1,
                    //                                         height: 16 * 1,
                    //                                         child: Image.asset(
                    //                                           AppImages.appLogo,
                    //                                           width: 16 * 1,
                    //                                           height: 16 * 1,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   // enteryournameherebKs (27:171)
                    //                                   left: 47.0834350586 * 1,
                    //                                   top: 21.5 * 1,
                    //                                   child: Align(
                    //                                     child: SizedBox(
                    //                                       width: 105 * 1,
                    //                                       height: 13 * 1,
                    //                                       child: Text(
                    //                                         'enter your name here',
                    //                                         style:
                    //                                             GoogleFonts.quicksand(
                    //                                           fontSize: 10 * 1,
                    //                                           fontWeight:
                    //                                               FontWeight.w600,
                    //                                           height: 1.25 * 1 / 1,
                    //                                           color:
                    //                                               Color(0xff9d9d9d),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 14 * 1,
                    //                   ),
                    //                   Container(
                    //                     // group10000039435Vw (27:203)
                    //                     width: double.infinity,
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Container(
                    //                           // emailqV7 (27:206)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 0 * 1, 3 * 1),
                    //                           child: Text(
                    //                             'Email',
                    //                             style: GoogleFonts.quicksand(
                    //                               fontSize: 16 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.25 * 1 / 1,
                    //                               color: Color(0xf12183a),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group1000003910xZj (27:204)
                    //                           width: double.infinity,
                    //                           height: 52 * 1,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xffffffff),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(8 * 1),
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Color(0x14000000),
                    //                                 offset: Offset(0 * 1, 4 * 1),
                    //                                 blurRadius: 8 * 1,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Container(
                    //                             // group100000393546y (27:207)
                    //                             width: 152.08 * 1,
                    //                             height: double.infinity,
                    //                             child: Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   // group1000003934Puw (27:208)
                    //                                   left: 0 * 1,
                    //                                   top: 0 * 1,
                    //                                   child: Container(
                    //                                     padding: EdgeInsets.fromLTRB(
                    //                                         17 * 1,
                    //                                         20.13 * 1,
                    //                                         16.36 * 1,
                    //                                         19.87 * 1),
                    //                                     width: 49.36 * 1,
                    //                                     height: 52 * 1,
                    //                                     decoration: BoxDecoration(
                    //                                       color: Color(0xffffffff),
                    //                                       borderRadius:
                    //                                           BorderRadius.only(
                    //                                         topLeft: Radius.circular(
                    //                                             8 * 1),
                    //                                         bottomLeft:
                    //                                             Radius.circular(
                    //                                                 8 * 1),
                    //                                       ),
                    //                                     ),
                    //                                     child: Center(
                    //                                       // iconheroiconssolidmail5nm (27:225)
                    //                                       child: SizedBox(
                    //                                         width: 16 * 1,
                    //                                         height: 12 * 1,
                    //                                         child: Image.asset(
                    //                                           AppImages.appLogo,
                    //                                           width: 16 * 1,
                    //                                           height: 12 * 1,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   // enteryournameherepEZ (27:212)
                    //                                   left: 47.0834350586 * 1,
                    //                                   top: 21.5 * 1,
                    //                                   child: Align(
                    //                                     child: SizedBox(
                    //                                       width: 105 * 1,
                    //                                       height: 13 * 1,
                    //                                       child: Text(
                    //                                         'enter your name here',
                    //                                         style:
                    //                                             GoogleFonts.quicksand(
                    //                                           fontSize: 10 * 1,
                    //                                           fontWeight:
                    //                                               FontWeight.w600,
                    //                                           height: 1.25 * 1 / 1,
                    //                                           color:
                    //                                               Color(0xff9d9d9d),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 14 * 1,
                    //                   ),
                    //                   Container(
                    //                     // group1000003947Htq (28:9)
                    //                     width: double.infinity,
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Container(
                    //                           // fatheroccupation3t1 (27:216)
                    //                           margin: EdgeInsets.fromLTRB(
                    //                               0 * 1, 0 * 1, 0 * 1, 5 * 1),
                    //                           child: Text(
                    //                             'Father occupation',
                    //                             style: GoogleFonts.quicksand(
                    //                               fontSize: 16 * 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               height: 1.25 * 1 / 1,
                    //                               color: Color(0xf12183a),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           // group1000003910BUR (27:214)
                    //                           width: double.infinity,
                    //                           height: 52 * 1,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xffffffff),
                    //                             borderRadius:
                    //                                 BorderRadius.circular(8 * 1),
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Color(0x14000000),
                    //                                 offset: Offset(0 * 1, 4 * 1),
                    //                                 blurRadius: 8 * 1,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Stack(
                    //                             children: [
                    //                               Positioned(
                    //                                 // rectangle22787HnM (27:219)
                    //                                 left: 0 * 1,
                    //                                 top: 0 * 1,
                    //                                 child: Align(
                    //                                   child: SizedBox(
                    //                                     width: 49.36 * 1,
                    //                                     height: 52 * 1,
                    //                                     child: Container(
                    //                                       decoration: BoxDecoration(
                    //                                         color: Color(0xffffffff),
                    //                                         borderRadius:
                    //                                             BorderRadius.only(
                    //                                           topLeft:
                    //                                               Radius.circular(
                    //                                                   8 * 1),
                    //                                           bottomLeft:
                    //                                               Radius.circular(
                    //                                                   8 * 1),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Positioned(
                    //                                 // groupC8d (28:2)
                    //                                 left: 14.8696289062 * 1,
                    //                                 top: 17.5 * 1,
                    //                                 child: Align(
                    //                                   child: SizedBox(
                    //                                     width: 19.62 * 1,
                    //                                     height: 17 * 1,
                    //                                     child: Image.asset(
                    //                                       AppImages.appLogo,
                    //                                       width: 19.62 * 1,
                    //                                       height: 17 * 1,
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Positioned(
                    //                                 // enteryournamehere7Fb (27:222)
                    //                                 left: 47.0834350586 * 1,
                    //                                 top: 21.5 * 1,
                    //                                 child: Align(
                    //                                   child: SizedBox(
                    //                                     width: 105 * 1,
                    //                                     height: 13 * 1,
                    //                                     child: Text(
                    //                                       'enter your name here',
                    //                                       style:
                    //                                           GoogleFonts.quicksand(
                    //                                         fontSize: 10 * 1,
                    //                                         fontWeight:
                    //                                             FontWeight.w600,
                    //                                         height: 1.25 * 1 / 1,
                    //                                         color: Color(0xff9d9d9d),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Container(
                    //               // group1000003942oeD (27:198)
                    //               width: double.infinity,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(8 * 1),
                    //               ),
                    //               child: Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   Container(
                    //                     // descriptionMQq (27:201)
                    //                     margin: EdgeInsets.fromLTRB(
                    //                         0 * 1, 0 * 1, 0 * 1, 2.63 * 1),
                    //                     child: Text(
                    //                       'Description',
                    //                       style: GoogleFonts.quicksand(
                    //                         fontSize: 16 * 1,
                    //                         fontWeight: FontWeight.w600,
                    //                         height: 1.25 * 1 / 1,
                    //                         color: Color(0xf12183a),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   Container(
                    //                     // group1000003910Gnh (27:199)
                    //                     padding: EdgeInsets.fromLTRB(14.68 * 1,
                    //                         13.87 * 1, 14.68 * 1, 13.87 * 1),
                    //                     width: double.infinity,
                    //                     height: 99 * 1,
                    //                     decoration: BoxDecoration(
                    //                       color: Color(0xffffffff),
                    //                       borderRadius: BorderRadius.circular(8 * 1),
                    //                       boxShadow: [
                    //                         BoxShadow(
                    //                           color: Color(0x14000000),
                    //                           offset: Offset(0 * 1, 4 * 1),
                    //                           blurRadius: 8 * 1,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     child: Text(
                    //                       'Enter your description',
                    //                       style: GoogleFonts.quicksand(
                    //                         fontSize: 10 * 1,
                    //                         fontWeight: FontWeight.w600,
                    //                         height: 1.25 * 1 / 1,
                    //                         color: Color(0xff9d9d9d),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         // group10000039338K7 (28:11)
                    //         margin: EdgeInsets.fromLTRB(
                    //             0.49 * 1, 0 * 1, 0.1 * 1, 16.34 * 1),
                    //         width: double.infinity,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Container(
                    //               // incomecertificatevoucher3ws (28:13)
                    //               margin: EdgeInsets.fromLTRB(
                    //                   0 * 1, 0 * 1, 0 * 1, 34 * 1),
                    //               child: Text(
                    //                 'Income certificate & voucher',
                    //                 style: GoogleFonts.quicksand(
                    //                   fontSize: 20 * 1,
                    //                   fontWeight: FontWeight.w600,
                    //                   height: 1.25 * 1 / 1,
                    //                   color: Color(0xf12183a),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               // group1000003928Mhf (28:14)
                    //               margin: EdgeInsets.fromLTRB(
                    //                   0.2 * 1, 0 * 1, 0 * 1, 0 * 1),
                    //               width: 379.6 * 1,
                    //               height: 90.66 * 1,
                    //               child: Image.asset(
                    //                 AppImages.appLogo,
                    //                 width: 379.6 * 1,
                    //                 height: 90.66 * 1,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         // frame1000003918DUy (29:31)
                    //         margin:
                    //             EdgeInsets.fromLTRB(80.39 * 1, 0 * 1, 80 * 1, 0 * 1),
                    //         width: double.infinity,
                    //         height: 53 * 1,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xff2a81bf),
                    //           borderRadius: BorderRadius.circular(4 * 1),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             'DONATE',
                    //             style: GoogleFonts.quicksand(
                    //               fontSize: 20 * 1,
                    //               fontWeight: FontWeight.w500,
                    //               height: 1.25 * 1 / 1,
                    //               color: Color(0xffffffff),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   // group10000039413U1 (27:110)
                    //   padding:
                    //       EdgeInsets.fromLTRB(16 * 1, 20.65 * 1, 16 * 1, 28.15 * 1),
                    //   width: double.infinity,
                    //   height: 78.8 * 1,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xffffffff),
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(20 * 1),
                    //       topRight: Radius.circular(20 * 1),
                    //     ),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Color(0x14000000),
                    //         offset: Offset(2 * 1, 0 * 1),
                    //         blurRadius: 8 * 1,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Container(
                    //     // group10000039266hB (27:112)
                    //     padding:
                    //         EdgeInsets.fromLTRB(3 * 1, 2.5 * 1, 4.5 * 1, 2.5 * 1),
                    //     width: double.infinity,
                    //     height: double.infinity,
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Container(
                    //           // iconheroiconssolidhome2Kw (27:113)
                    //           margin:
                    //               EdgeInsets.fromLTRB(0 * 1, 0 * 1, 98 * 1, 0 * 1),
                    //           width: 24 * 1,
                    //           height: 24 * 1,
                    //           child: Image.asset(
                    //             AppImages.appLogo,
                    //             width: 24 * 1,
                    //             height: 24 * 1,
                    //           ),
                    //         ),
                    //         Container(
                    //           // iconheroiconssolidphoneL5j (27:115)
                    //           margin:
                    //               EdgeInsets.fromLTRB(0 * 1, 0 * 1, 95.18 * 1, 0 * 1),
                    //           width: 24 * 1,
                    //           height: 24 * 1,
                    //           child: Image.asset(
                    //             AppImages.appLogo,
                    //             width: 24 * 1,
                    //             height: 24 * 1,
                    //           ),
                    //         ),
                    //         Container(
                    //           // nounconsumer60970821qYH (27:117)
                    //           margin:
                    //               EdgeInsets.fromLTRB(0 * 1, 0 * 1, 96.68 * 1, 0 * 1),
                    //           width: 29.64 * 1,
                    //           height: 25 * 1,
                    //           child: Image.asset(
                    //             AppImages.appLogo,
                    //             width: 29.64 * 1,
                    //             height: 25 * 1,
                    //           ),
                    //         ),
                    //         Container(
                    //           // iconheroiconssoliduser93B (27:119)
                    //           width: 21 * 1,
                    //           height: 22.5 * 1,
                    //           child: Image.asset(
                    //             AppImages.appLogo,
                    //             width: 21 * 1,
                    //             height: 22.5 * 1,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            homeScreenProvider.isLoading
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
        ),
      ),
    );
  }
}
