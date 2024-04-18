import 'package:feedonations/Components/top_app_bar.dart';
import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // iphone14plus11r61 (150:595)
        padding: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 0.2 * 1),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(30 * 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAppBarWithTitle(
                title: 'Help center',
              ),
              ContactUsElevatedCard(),
              Container(
                // group1000003982kM3 (151:92)
                margin: EdgeInsets.symmetric(horizontal: 24), width: 148 * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 23.14 * 1),
                      padding:
                          EdgeInsets.fromLTRB(0 * 1, 2.7 * 1, 0 * 1, 2.71 * 1),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // socialiconnYd (151:74)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0 * 1, 25.14 * 1, 0 * 1),
                            width: 28.86 * 1,
                            height: 23.45 * 1,
                            child: SvgPicture.asset(
                              AppSvg.twitterIcon,
                              width: 28.86 * 1,
                              height: 23.45 * 1,
                            ),
                          ),
                          Container(
                            // jahangiralihfb (151:84)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0.14 * 1, 0 * 1, 0 * 1),
                            child: Text(
                              '@twitter',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16 * 1,
                                fontWeight: FontWeight.w500,
                                height: 1.3125 * 1 / 1,
                                color: Color(0xff3a3a3a),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // group10000039802Sy (151:90)
                      margin:
                          EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 24.14 * 1),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // socialiconN13 (151:76)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0 * 1, 25.14 * 1, 0 * 1),
                            width: 28.86 * 1,
                            height: 28.86 * 1,
                            child: SvgPicture.asset(
                              AppSvg.linkdlnIcon,
                              width: 28.86 * 1,
                              height: 28.86 * 1,
                            ),
                          ),
                          Container(
                            // jahangiraliV5f (151:85)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0.14 * 1, 0 * 1, 0 * 1),
                            child: Text(
                              '@linkdln',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16 * 1,
                                fontWeight: FontWeight.w500,
                                height: 1.3125 * 1 / 1,
                                color: Color(0xff3a3a3a),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // group1000003978p7w (151:88)
                      margin:
                          EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 24.14 * 1),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // socialicon9g1 (151:79)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0 * 1, 25.14 * 1, 0 * 1),
                            width: 28.86 * 1,
                            height: 28.86 * 1,
                            child: SvgPicture.asset(
                              AppSvg.roundIcon,
                              width: 28.86 * 1,
                              height: 28.86 * 1,
                            ),
                          ),
                          Container(
                            // jahangiraliGVj (151:86)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0.14 * 1, 0 * 1, 0 * 1),
                            child: Text(
                              '@round',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16 * 1,
                                fontWeight: FontWeight.w500,
                                height: 1.3125 * 1 / 1,
                                color: Color(0xff3a3a3a),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // group1000003979CPP (151:89)
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // behance111xNZ (151:81)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0 * 1, 24 * 1, 0 * 1),
                            width: 30 * 1,
                            height: 30 * 1,
                            child: SvgPicture.asset(
                              AppSvg.behanceIcon,
                              width: 30 * 1,
                              height: 30 * 1,
                            ),
                          ),
                          Container(
                            // jahangiraliH9w (151:87)
                            margin:
                                EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 1 * 1),
                            child: Text(
                              '@behance',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 16 * 1,
                                fontWeight: FontWeight.w500,
                                height: 1.3125 * 1 / 1,
                                color: Color(0xff3a3a3a),
                              ),
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
        ),
      ),
    );
  }
}

class ContactUsElevatedCard extends StatelessWidget {
  const ContactUsElevatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // autogroupile9geh (TgBGFb2dRhecXT9qwKiLe9)
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      padding: EdgeInsets.fromLTRB(18 * 1, 24 * 1, 25 * 1, 34 * 1),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20 * 1),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0 * 1, 4 * 1),
            blurRadius: 8 * 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // ellipse124w4q (151:29)
            margin: EdgeInsets.fromLTRB(140 * 1, 0 * 1, 133 * 1, 16 * 1),
            width: double.infinity,
            height: 64 * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32 * 1),
              image: DecorationImage(
                image: AssetImage(
                  AppImages.logoIcon,
                ),
              ),
            ),
          ),
          Container(
            // aboutapplicationSXP (151:25)
            margin: EdgeInsets.fromLTRB(7 * 1, 0 * 1, 0 * 1, 6 * 1),
            child: Text(
              'about application',
              style: GoogleFonts.quicksand(
                fontSize: 24 * 1,
                fontWeight: FontWeight.w700,
                height: 1.25 * 1 / 1,
                color: Color.fromARGB(255, 18, 24, 58),
              ),
            ),
          ),
          Container(
            // loremipsumissimplydummytextoft (151:26)
            margin: EdgeInsets.fromLTRB(7 * 1, 0 * 1, 0 * 1, 16 * 1),
            constraints: BoxConstraints(
              maxWidth: 330 * 1,
            ),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14 * 1,
                fontWeight: FontWeight.w500,
                height: 1.5 * 1 / 1,
                color: Color(0xff3a3a3a),
              ),
            ),
          ),
          Container(
            // contactusZEd (151:31)
            margin: EdgeInsets.fromLTRB(7 * 1, 0 * 1, 0 * 1, 15 * 1),
            child: Text(
              'Contact us',
              style: GoogleFonts.quicksand(
                fontSize: 24 * 1,
                fontWeight: FontWeight.w700,
                height: 1.25 * 1 / 1,
                color: Color.fromARGB(255, 18, 24, 58),
              ),
            ),
          ),
          Container(
            // group1000003976gKF (151:64)
            margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 149 * 1, 19 * 1),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // group1000003975Da5 (151:63)
                  margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 20 * 1, 0 * 1),
                  width: 38 * 1,
                  height: 38 * 1,
                  child: SvgPicture.asset(
                    AppSvg.phoneIcon,
                    width: 30 * 1,
                    height: 30 * 1,
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  // wW5 (151:32)
                  margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 1 * 1),
                  child: Text(
                    '+923554938188',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16 * 1,
                      fontWeight: FontWeight.w500,
                      height: 1.3125 * 1 / 1,
                      color: Color(0xff3a3a3a),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // group1000003977G2Z (151:65)
            margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 53 * 1, 0 * 1),
            width: double.infinity,
            height: 38 * 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // group1000003975Cgu (151:66)
                  margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 20 * 1, 0 * 1),
                  padding: EdgeInsets.fromLTRB(7 * 1, 7 * 1, 7 * 1, 7 * 1),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x192a81bf),
                    borderRadius: BorderRadius.circular(19 * 1),
                  ),
                  child: Center(
                    // iconfeathericonsmailKWd (151:70)
                    child: SizedBox(
                      width: 24 * 1,
                      height: 24 * 1,
                      child: SvgPicture.asset(
                        AppSvg.mailIcon,
                        color: kPrimaryColor,
                        theme:
                            SvgTheme(currentColor: kPrimaryColor, xHeight: 49),
                        // color: iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  // jahangeerali97252gmailcomEtV (151:69)
                  margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 1 * 1),
                  child: Text(
                    'Jahangeerali97252gmail.com',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16 * 1,
                      fontWeight: FontWeight.w500,
                      height: 1.3125 * 1 / 1,
                      color: Color(0xff3a3a3a),
                    ),
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
