import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilis/images.dart';
class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          23.61 * 1, 0 * 1, 24.4 * 1, 36.77 * 1),
      width: double.infinity,
      height: 144 * 1,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
            18.14 * 1, 17.53 * 1, 18.14 * 1, 14 * 1),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0x33000000),
          borderRadius: BorderRadius.circular(10 * 1),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.appLogo),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // wecanthelpeveryonebuteveryonec (13:257)
              margin: const EdgeInsets.fromLTRB(
                  0 * 1, 0 * 1, 0 * 1, 10.47 * 1),
              constraints: const BoxConstraints(
                maxWidth: 212 * 1,
              ),
              child: Text(
                "We can’t help everyone.but everyone can help  someone.",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Container(
              // frame1000003916ReD (13:255)
              margin: const EdgeInsets.fromLTRB(
                  2.01 * 1, 0 * 1, 0 * 1, 0 * 1),
              width: 113.23 * 1,
              height: 34 * 1,
              decoration: BoxDecoration(
                color: const Color(0xcc1273b8),
                borderRadius: BorderRadius.circular(4 * 1),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0 * 1, 6 * 1),
                    blurRadius: 8 * 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Donate',
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


