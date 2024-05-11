import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
// Text(
//                           jobDescription,
//                           style: GoogleFonts.quicksand(
//                             fontSize: 12 * 1,
//                             fontWeight: FontWeight.w400,
//                             height: 1.25 * 1 / 1,
//                             color: Color(0xff555555),
//                           ),
//                         ),

  ReadMoreText({required this.text, required this.maxLength});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            isExpanded ? widget.text : (widget.text.substring(0, 30) + '...'),
            textAlign: TextAlign.left,
            softWrap: true,
          ),
          Text(
            isExpanded ? 'Read less' : 'Read more',
            style: GoogleFonts.quicksand(
              fontSize: 12 * 1,
              fontWeight: FontWeight.w400,
              height: 1.25 * 1 / 1,
              color: Color(0xff555555),
            ),
          ),
        ],
      ),
    );
  }
}
