import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // group1000003908kBX (13:259)
      margin: EdgeInsets.fromLTRB(23.61 * 1, 0 * 1, 24.39 * 1, 23.49 * 1),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // hellorashidsmw (13:258)
            margin: EdgeInsets.all(9.0),
            // constraints: BoxConstraints(
            //   maxWidth: 58 * 1,
            // ),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.25 / 1,
                  color: Color(0xff111839),
                ),
                children: [
                  TextSpan(
                    text: 'hello \n',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                      color: Color(0xff111839),
                    ),
                  ),
                  TextSpan(
                    text: 'Rashid',
                  ),
                ],
              ),
            ),
          ),
          Container(
            // ellipse46YD (11:103)
            margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 0.51 * 1),
            width: 42.13 * 1,
            height: 42.13 * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0644226074 * 1),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.appLogo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
