import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DRFormTextField extends StatelessWidget {
  const DRFormTextField(
      {super.key,
      required this.iconUrl,
      required this.title,
      required this.hintText,
      this.controller});
  final String iconUrl;
  final String hintText;
  final String title;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // name62H (26:44)
            margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 10),
            child: Text(
              title,
              style: GoogleFonts.quicksand(
                fontSize: 16 * 1,
                fontWeight: FontWeight.w600,
                height: 1.25 * 1 / 1,
                color: kTitleColor,
              ),
            ),
          ),
          Container(
            // group1000003910DMo (16:89)
            width: double.infinity,
            height: 52 * 1,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(8 * 1),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0 * 1, 4 * 1),
                  blurRadius: 8 * 1,
                ),
              ],
            ),
            child: Row(
              children: [
                // Positioned(
                //   // group1000003934tTw (26:46)
                //   left: 0 * 1,
                //   top: 0 * 1,
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(
                //         17.68 * 1, 19 * 1, 17.68 * 1, 18 * 1),
                //     width: 49.36 * 1,
                //     height: 52 * 1,
                //     decoration: BoxDecoration(
                //       color: Color(0xffffffff),
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(8 * 1),
                //         bottomLeft: Radius.circular(8 * 1),
                //       ),
                //     ),
                //     child: Center(
                //       // iconheroiconssolidusermXj (18:978)
                //       child: ,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   // enteryournameheregeh (26:45)
                //   left: 47.0834960938 * 1,
                //   top: 21.5 * 1,
                //   child: Align(
                //     child: ),
                // ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 14 * 1,
                  height: 15 * 1,
                  child: SvgPicture.asset(
                    iconUrl,
                    width: 14 * 1,
                    height: 15 * 1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.quicksand(
                          fontSize: 10 * 1,
                          fontWeight: FontWeight.w600,
                          height: 1.25 * 1 / 1,
                          color: Color(0xff9d9d9d),
                        )),
                    style: GoogleFonts.quicksand(
                        fontSize: 10 * 1,
                        fontWeight: FontWeight.w600,
                        height: 1.25 * 1 / 1,
                        color: kTitleColor),
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
