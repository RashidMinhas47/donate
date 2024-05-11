import 'package:feedonations/Components/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

import '../Utilis/images.dart';

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.jobTitle,
    required this.jobDescription,
  });
  final String imageUrl;
  final String name;
  final String jobTitle;
  final String jobDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      // autogroup8z6mKdw (TgBDJvRzyT4soXGqMS8Z6M)
      margin: EdgeInsets.fromLTRB(0.39 * 1, 0 * 1, 27.61 * 1, 24 * 1),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // imagerds (148:439)
            margin: const EdgeInsets.fromLTRB(0 * 1, 0 * 1, 21.3 * 1, 0 * 1),
            width: 117.7 * 1,
            height: 124.42 * 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13 * 1),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            // autogroupq3xkBAM (TgBDVFU8AMMXNiVHpuQ3XK)

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // group10000039677Ju (150:526)
                  margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 18 * 1),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // nameeZj (148:443)
                        margin:
                            EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 13 * 1),
                        child: Text(
                          name,
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.7881637812,
                            color: Color.fromARGB(255, 16, 23, 40),
                          ),
                        ),
                      ),
                      Container(
                        // roleyM7 (148:444)
                        margin:
                            EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 12 * 1),
                        child: Text(
                          jobTitle,
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0.8407080514,
                            color: Color(0xff2a81bf),
                          ),
                        ),
                      ),
                      Container(
                          // supportingtextHsb (148:445)
                          constraints: BoxConstraints(maxWidth: 200),
                          child: ReadMoreText(
                            maxLength: 4,
                            text: jobDescription,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  // autogroupsya5QhK (TgBDcL6fHMeYooqXJ9syA5)
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // socialiconARb (151:45)
                        margin: EdgeInsets.fromLTRB(
                            0 * 1, 0 * 1, 19.24 * 1, 0.91 * 1),
                        width: 23.09 * 1,
                        height: 23.09 * 1,
                        child: SvgPicture.asset(
                          AppSvg.twitterIcon,
                          width: 23.09 * 1,
                          height: 23.09 * 1,
                        ),
                      ),
                      Container(
                        // socialiconUBP (151:47)
                        margin: EdgeInsets.fromLTRB(
                            0 * 1, 0 * 1, 19.24 * 1, 0.91 * 1),
                        width: 23.09 * 1,
                        height: 23.09 * 1,
                        child: SvgPicture.asset(
                          AppSvg.linkdlnIcon,
                          width: 23.09 * 1,
                          height: 23.09 * 1,
                        ),
                      ),
                      Container(
                        // socialiconyP3 (151:50)
                        margin: EdgeInsets.fromLTRB(
                            0 * 1, 0 * 1, 19.25 * 1, 0.91 * 1),
                        width: 23.09 * 1,
                        height: 23.09 * 1,
                        child: SvgPicture.asset(
                          AppSvg.roundIcon,
                          width: 23.09 * 1,
                          height: 23.09 * 1,
                        ),
                      ),
                      Container(
                        // behance111nLV (151:52)
                        width: 24 * 1,
                        height: 24 * 1,
                        child: SvgPicture.asset(
                          AppSvg.behanceIcon,
                          width: 24 * 1,
                          height: 24 * 1,
                        ),
                      ),
                    ],
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
