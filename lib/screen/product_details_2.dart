import 'dart:ui';

import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails2 extends StatelessWidget {
  const ProductDetails2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // iphone14plus9bPT (131:1543)
        width: double.infinity,
        height: 926 * 1,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(30 * 1),
        ),
        child: Stack(
          children: [
            Positioned(
              // iconfeathericonschevronleftUTF (151:103)
              left: 33 * 1,
              top: 77 * 1,
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
              // frame1000003919Aay (131:1544)
              left: 23.6082763672 * 1,
              top: 12.8721923828 * 1,
              child: Container(
                width: 380 * 1,
                height: 17 * 1,
                child: Container(
                  // group70JBP (131:1545)
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // 3Ps (131:1553)
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
                        // group1000003909YrR (131:1546)
                        margin: EdgeInsets.fromLTRB(0 * 1, 1 * 1, 0 * 1, 1 * 1),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorgxd (131:1547)
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
                              // vectorzTX (131:1548)
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
                              // grouphsj (131:1549)
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
              // getitdmP (131:1554)
              left: 183 * 1,
              top: 68 * 1,
              child: Align(
                child: SizedBox(
                  width: 63 * 1,
                  height: 30 * 1,
                  child: Text(
                    'Get it',
                    style: GoogleFonts.quicksand(
                      fontSize: 24 * 1,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * 1 / 1,
                      color: Color(0xf12183a),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // frame10000039187wT (131:1583)
              left: 77 * 1,
              top: 705 * 1,
              child: Container(
                width: 275 * 1,
                height: 53 * 1,
                decoration: BoxDecoration(
                  color: Color(0xff2a81bf),
                  borderRadius: BorderRadius.circular(4 * 1),
                ),
                child: Center(
                  child: Text(
                    'SEND DETAILS',
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
              // group1000003941yim (131:1585)
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
                  // group1000003926doK (131:1587)
                  padding:
                      EdgeInsets.fromLTRB(3 * 1, 2.5 * 1, 4.5 * 1, 2.5 * 1),
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // iconheroiconssolidhomekd3 (131:1588)
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
                        // iconheroiconssolidphoneUJ9 (131:1590)
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
                        // nounconsumer60970821NPX (131:1592)
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
                        // iconheroiconssoliduserVDF (131:1594)
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
              // group1000003949pFX (133:1597)
              left: 24 * 1,
              top: 272 * 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(85 * 1, 7 * 1, 87 * 1, 7 * 1),
                width: 382 * 1,
                height: 204 * 1,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x192a81bf1)),
                  color: Color(0x192a81bf),
                  borderRadius: BorderRadius.circular(30 * 1),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 663 * 1,
                      sigmaY: 663 * 1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // minhasali3e5 (133:1605)
                          margin:
                              EdgeInsets.fromLTRB(1 * 1, 0 * 1, 0 * 1, 7 * 1),
                          child: Text(
                            'Minhas Ali',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff403e3e),
                            ),
                          ),
                        ),
                        Container(
                          // line1a8D (133:1599)
                          margin:
                              EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 6 * 1),
                          width: double.infinity,
                          height: 1 * 1,
                          decoration: BoxDecoration(
                            color: Color(0x332a81bf),
                          ),
                        ),
                        Container(
                          // WXf (133:1606)
                          margin:
                              EdgeInsets.fromLTRB(1 * 1, 0 * 1, 0 * 1, 7 * 1),
                          child: Text(
                            '71501-2543546-5',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff403e3e),
                            ),
                          ),
                        ),
                        Container(
                          // line23Gh (133:1600)
                          margin:
                              EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 4 * 1),
                          width: double.infinity,
                          height: 1 * 1,
                          decoration: BoxDecoration(
                            color: Color(0x332a81bf),
                          ),
                        ),
                        Container(
                          // newhussainabaddanyorenk5 (133:1607)
                          margin:
                              EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 9 * 1),
                          child: Text(
                            'New Hussain Abad Danyore',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff403e3e),
                            ),
                          ),
                        ),
                        Container(
                          // line3v5b (133:1601)
                          margin:
                              EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 6 * 1),
                          width: double.infinity,
                          height: 1 * 1,
                          decoration: BoxDecoration(
                            color: Color(0x332a81bf),
                          ),
                        ),
                        Container(
                          // 4xV (133:1608)
                          margin:
                              EdgeInsets.fromLTRB(2 * 1, 0 * 1, 0 * 1, 7 * 1),
                          child: Text(
                            '03554938188',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff403e3e),
                            ),
                          ),
                        ),
                        Container(
                          // line4ofB (133:1602)
                          margin:
                              EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 6 * 1),
                          width: double.infinity,
                          height: 1 * 1,
                          decoration: BoxDecoration(
                            color: Color(0x332a81bf),
                          ),
                        ),
                        Container(
                          // maleMAu (133:1609)
                          margin:
                              EdgeInsets.fromLTRB(2 * 1, 0 * 1, 0 * 1, 7 * 1),
                          child: Text(
                            'Male',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff403e3e),
                            ),
                          ),
                        ),
                        Container(
                          // line556u (133:1603)
                          margin:
                              EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 6 * 1),
                          width: double.infinity,
                          height: 1 * 1,
                          decoration: BoxDecoration(
                            color: Color(0x332a81bf),
                          ),
                        ),
                        Container(
                          // yearsoldpqB (133:1610)
                          margin:
                              EdgeInsets.fromLTRB(1 * 1, 0 * 1, 0 * 1, 0 * 1),
                          child: Text(
                            '22 years old',
                            style: GoogleFonts.quicksand(
                              fontSize: 16 * 1,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * 1 / 1,
                              color: Color(0xff403e3e),
                            ),
                          ),
                        ),
                      ],
                    ),
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
