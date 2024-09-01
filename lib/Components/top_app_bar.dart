import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopAppBarWithTitle extends StatelessWidget {
  const TopAppBarWithTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      // autogrouptkhsh6d (TgBGYzhHjcEHXjiXt3Tkhs)
      width: double.infinity,
      child: Container(
        alignment: Alignment.center,
        // autogrouperxbHsT (TgBG7g69U7CmAEMMEdeRXB)
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              // helpcenter98y (151:23)
              title,
              style: GoogleFonts.quicksand(
                fontSize: 24 * 1,
                fontWeight: FontWeight.w700,
                height: 1.25 * 1 / 1,
                color: Color.fromARGB(255, 18, 24, 58),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
