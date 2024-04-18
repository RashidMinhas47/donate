import 'dart:ui';

import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiverDetails extends StatelessWidget {
  const ReceiverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // iphone14plus8i13 (131:1482)
        width: double.infinity,
        height: 926 * 1,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(30 * 1),
        ),
        child: Stack(
          children: [
            Positioned(
              // iconfeathericonschevronleftP7B (151:99)
              left: 33 * 1,
              top: 69 * 1,
              child: Align(
                child: SizedBox(
                  width: 6 * 1,
                  height: 12 * 1,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 6 * 1,
                    height: 12 * 1,
                  ),
                ),
              ),
            ),
            Positioned(
              // frame1000003919HCZ (131:1483)
              left: 23.6083030701 * 1,
              top: 12.8721923828 * 1,
              child: Container(
                width: 380 * 1,
                height: 17 * 1,
                child: Container(
                  // group702A9 (131:1484)
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // B33 (131:1492)
                        margin: EdgeInsets.fromLTRB(
                            0 * 1, 0 * 1, 283.97 * 1, 0 * 1),
                        child: Text(
                          '9:41',
                          style: GoogleFonts.inter(
                            fontSize: 14 * 1,
                            fontWeight: FontWeight.w600,
                            height: 1.2125 * 1 / 1,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // group1000003909fyo (131:1485)
                        margin: EdgeInsets.fromLTRB(0 * 1, 1 * 1, 0 * 1, 1 * 1),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorQgV (131:1486)
                              margin: EdgeInsets.fromLTRB(
                                  0 * 1, 0 * 1, 7.03 * 1, 0 * 1),
                              width: 15.06 * 1,
                              height: 15 * 1,
                              child: Image.asset(
                                AppImages.appLogo,
                                width: 15.06 * 1,
                                height: 15 * 1,
                              ),
                            ),
                            Container(
                              // vectoriSH (131:1487)
                              margin: EdgeInsets.fromLTRB(
                                  0 * 1, 0 * 1, 7.03 * 1, 1 * 1),
                              width: 16.06 * 1,
                              height: 12 * 1,
                              child: Image.asset(
                                AppImages.appLogo,
                                width: 16.06 * 1,
                                height: 12 * 1,
                              ),
                            ),
                            Container(
                              // groupSdB (131:1488)
                              width: 20.85 * 1,
                              height: 9 * 1,
                              child: Image.asset(
                                AppImages.appLogo,
                                width: 20.85 * 1,
                                height: 9 * 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // group1000003964xrR (131:1493)
              left: 160 * 1,
              top: 60 * 1,
              child: Container(
                width: 108 * 1,
                height: 151 * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // donateit5w3 (131:1494)
                      margin:
                          EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 16.7 * 1),
                      child: Text(
                        'Donate it',
                        style: GoogleFonts.quicksand(
                          fontSize: 24 * 1,
                          fontWeight: FontWeight.w700,
                          height: 1.25 * 1 / 1,
                          color: Color(0xf12183a),
                        ),
                      ),
                    ),
                    Container(
                      // ellipse123D1f (131:1495)
                      margin: EdgeInsets.fromLTRB(1 * 1, 0 * 1, 0 * 1, 0 * 1),
                      width: 105 * 1,
                      height: 104.3 * 1,
                      child: Image.asset(
                        AppImages.appLogo,
                        width: 105 * 1,
                        height: 104.3 * 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // group1000003949XY9 (131:1496)
              left: 24 * 1,
              top: 223 * 1,
              child: Container(
                width: 381 * 1,
                height: 340 * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30 * 1),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // rectangle227892zh (131:1497)
                      left: 0 * 1,
                      top: 0 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 380 * 1,
                          height: 340 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30 * 1),
                              border: Border.all(color: Color(0xffe2e2e2)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  offset: Offset(0 * 1, 5 * 1),
                                  blurRadius: 8 * 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line1uYh (131:1498)
                      left: 0 * 1,
                      top: 34 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 381 * 1,
                          height: 1 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe2e2e2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line22dK (131:1499)
                      left: 0 * 1,
                      top: 68 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 381 * 1,
                          height: 1 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe2e2e2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line3ADj (131:1500)
                      left: 0 * 1,
                      top: 102 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 381 * 1,
                          height: 1 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe2e2e2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line46NH (131:1501)
                      left: 0 * 1,
                      top: 136 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 381 * 1,
                          height: 1 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe2e2e2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line52Fw (131:1502)
                      left: 0 * 1,
                      top: 170 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 381 * 1,
                          height: 1 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe2e2e2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line6MZ7 (131:1503)
                      left: 0 * 1,
                      top: 204 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 381 * 1,
                          height: 1 * 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe2e2e2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // minhasaliHhf (131:1504)
                      left: 153 * 1,
                      top: 7 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 75 * 1,
                          height: 20 * 1,
                          child: Text(
                            'Minhas Ali',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // zry (131:1505)
                      left: 129 * 1,
                      top: 41 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 123 * 1,
                          height: 20 * 1,
                          child: Text(
                            '71501-2543546-5',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // newhussainabaddanyoreWaR (131:1506)
                      left: 85 * 1,
                      top: 73 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 210 * 1,
                          height: 20 * 1,
                          child: Text(
                            'New Hussain Abad Danyore',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // minhasali78gmailcomctM (131:1507)
                      left: 99 * 1,
                      top: 109 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 183 * 1,
                          height: 20 * 1,
                          child: Text(
                            'minhasali78@gmail.com',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // farmeriRb (131:1508)
                      left: 162 * 1,
                      top: 143 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 56 * 1,
                          height: 20 * 1,
                          child: Text(
                            'Farmer',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // yearsoldpzR (131:1509)
                      left: 144 * 1,
                      top: 177 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 93 * 1,
                          height: 20 * 1,
                          child: Text(
                            '22 years old',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // loremipsumissimplydummytextoft (131:1510)
                      left: 34.5 * 1,
                      top: 211 * 1,
                      child: Align(
                        child: SizedBox(
                          width: 312 * 1,
                          height: 112 * 1,
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.75 * 1 / 1,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // group1000003933wBs (131:1511)
              left: 24 * 1,
              top: 579 * 1,
              child: Container(
                width: 380 * 1,
                height: 150 * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // incomecertificatevoucherGE9 (131:1513)
                      margin:
                          EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 34.14 * 1),
                      child: Text(
                        'Income certificate & voucher',
                        style: GoogleFonts.quicksand(
                          fontSize: 20 * 1,
                          fontWeight: FontWeight.w600,
                          height: 1.25 * 1 / 1,
                          color: Color(0xf12183a),
                        ),
                      ),
                    ),
                    Container(
                      // group1000003928yeM (131:1514)
                      margin: EdgeInsets.fromLTRB(0.2 * 1, 0 * 1, 0 * 1, 0 * 1),
                      width: 379.8 * 1,
                      height: 90.86 * 1,
                      child: Image.asset(
                        AppImages.appLogo,
                        width: 379.8 * 1,
                        height: 90.86 * 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // group10000039416U5 (131:1529)
              left: 0 * 1,
              top: 847 * 1,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(16 * 1, 20.65 * 1, 16 * 1, 28.15 * 1),
                width: 428 * 1,
                height: 78.8 * 1,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20 * 1),
                    topRight: Radius.circular(20 * 1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(2 * 1, 0 * 1),
                      blurRadius: 8 * 1,
                    ),
                  ],
                ),
                child: Container(
                  // group1000003926ZsT (131:1531)
                  padding:
                      EdgeInsets.fromLTRB(3 * 1, 2.5 * 1, 4.5 * 1, 2.5 * 1),
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // iconheroiconssolidhome6cV (131:1532)
                        margin:
                            EdgeInsets.fromLTRB(0 * 1, 0 * 1, 98 * 1, 0 * 1),
                        width: 24 * 1,
                        height: 24 * 1,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: 24 * 1,
                          height: 24 * 1,
                        ),
                      ),
                      Container(
                        // iconheroiconssolidphoneQt5 (131:1534)
                        margin:
                            EdgeInsets.fromLTRB(0 * 1, 0 * 1, 95.18 * 1, 0 * 1),
                        width: 24 * 1,
                        height: 24 * 1,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: 24 * 1,
                          height: 24 * 1,
                        ),
                      ),
                      Container(
                        // nounconsumer609708218ZB (131:1536)
                        margin:
                            EdgeInsets.fromLTRB(0 * 1, 0 * 1, 96.68 * 1, 0 * 1),
                        width: 29.64 * 1,
                        height: 25 * 1,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: 29.64 * 1,
                          height: 25 * 1,
                        ),
                      ),
                      Container(
                        // iconheroiconssoliduserrEH (131:1538)
                        width: 21 * 1,
                        height: 22.5 * 1,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: 21 * 1,
                          height: 22.5 * 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // frame1000003918z5b (131:1540)
              left: 112.5 * 1,
              top: 765 * 1,
              child: Container(
                width: 203 * 1,
                height: 53 * 1,
                decoration: BoxDecoration(
                  color: Color(0xff2a81bf),
                  borderRadius: BorderRadius.circular(4 * 1),
                ),
                child: Center(
                  child: Text(
                    'send it',
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
            Positioned(
              // rectangle22802dPT (131:1542)
              left: 0 * 1,
              top: 0 * 1,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4 * 1,
                    sigmaY: 4 * 1,
                  ),
                  child: Align(
                    child: SizedBox(
                      width: 428 * 1,
                      height: 928 * 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x8cffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle22789iQu (131:124)
              left: 25 * 1,
              top: 325 * 1,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 663 * 1,
                    sigmaY: 663 * 1,
                  ),
                  child: Align(
                    child: SizedBox(
                      width: 380 * 1,
                      height: 189 * 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30 * 1),
                          border: Border.all(color: Color(0x192a81bf)),
                          color: Color(0x192a81bf),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // line1CL5 (131:125)
              left: 153 * 1,
              top: 361 * 1,
              child: Align(
                child: SizedBox(
                  width: 127 * 1,
                  height: 1 * 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x332a81bf),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group1000003983Va5 (153:691)
              left: 153 * 1,
              top: 412 * 1,
              child: Container(
                width: 127 * 1,
                height: 52 * 1,
              ),
            ),
            Positioned(
              // 2pu (131:132)
              left: 162 * 1,
              top: 375 * 1,
              child: Align(
                child: SizedBox(
                  width: 106 * 1,
                  height: 23 * 1,
                  child: Text(
                    '03554938188',
                    style: GoogleFonts.quicksand(
                      fontSize: 18 * 1,
                      fontWeight: FontWeight.w500,
                      height: 1.25 * 1 / 1,
                      color: Color(0xff403e3e),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // wBB (131:134)
              left: 160 * 1,
              top: 477 * 1,
              child: Align(
                child: SizedBox(
                  width: 109 * 1,
                  height: 23 * 1,
                  child: Text(
                    '03434543548',
                    style: GoogleFonts.quicksand(
                      fontSize: 18 * 1,
                      fontWeight: FontWeight.w500,
                      height: 1.25 * 1 / 1,
                      color: Color(0xff403e3e),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // whatsapp1Fhf (153:674)
              left: 167.0001983643 * 1,
              top: 329.0087280273 * 1,
              child: Align(
                child: SizedBox(
                  width: 94.59 * 1,
                  height: 27.98 * 1,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 94.59 * 1,
                    height: 27.98 * 1,
                  ),
                ),
              ),
            ),
            Positioned(
              // vibericon1MEu (153:685)
              left: 201 * 1,
              top: 423 * 1,
              child: Align(
                child: SizedBox(
                  width: 28 * 1,
                  height: 28 * 1,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 28 * 1,
                    height: 28 * 1,
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
