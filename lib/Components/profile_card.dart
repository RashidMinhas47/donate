import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.imgURL, required this.label});
  final String imgURL;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      // frame48Pf (11:71)
      margin: const EdgeInsets.fromLTRB(0 * 1, 0 * 1, 17.36 * 1, 0 * 1),
      width: 82.36 * 1,
      height: 82.36 * 1,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xe51273b8)),
        borderRadius: BorderRadius.circular(6.9959511757 * 1),
      ),
      child: Stack(
        children: [
          Positioned(
            // image1Dg1 (11:72)
            left: 0 * 1,
            top: 0 * 1,
            child: SizedBox(
              width: 82.36 * 1,
              height: 88.15 * 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4+2),
                child: Image.network(
                  imgURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            // frame1000003899wc1 (11:73)
            left: 0 * 1,
            top: 69.0043334961 * 1,
            child: Container(
              width: 82.55 * 1,
              height: 18.89 * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4+2),
                gradient: const LinearGradient(
                  begin: Alignment(-0.213, 0.94),
                  end: Alignment(-0.211, -1),
                  colors: <Color>[Color(0x7f0a68ac), Color(0x7f1273b8)],
                  stops: <double>[0, 1],
                ),
              ),
              child: Center(
                child: Text(
                  'For $label',
                  style: GoogleFonts.jost(
                    fontSize: 6.9959511757,
                    fontWeight: FontWeight.w500,
                    height: 1.445,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
