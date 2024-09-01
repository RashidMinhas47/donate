import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorLastView extends StatelessWidget {
  const DonorLastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 12.9, 0, 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(23.6, 0, 24.4, 38.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 8.5, 0),
                      child: SizedBox(
                        width: 29.6,
                        child: Text(
                          '9:41',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                      child: SizedBox(
                        width: 66,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                              child: SizedBox(
                                width: 15.1,
                                height: 15,
                                child: SvgPicture.network(
                                  'assets/vectors/vector_205_x2.svg',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 1, 7, 2),
                              child: SizedBox(
                                width: 16.1,
                                height: 12,
                                child: SvgPicture.network(
                                  'assets/vectors/vector_263_x2.svg',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                              child: SizedBox(
                                width: 20.9,
                                height: 9,
                                child: SvgPicture.network(
                                  'assets/vectors/group_6_x2.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(33, 0, 33, 174),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 212.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 9, 0, 9),
                          width: 24,
                          height: 24,
                          child:
                          SizedBox(
                            width: 6,
                            height: 12,
                            child: SvgPicture.network(
                              'assets/vectors/vector_108_x2.svg',
                            ),
                          ),
                        ),
                        Text(
                          'Get it',
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: const Color(0xFF12183A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 22, 229),
                child: Opacity(
                  opacity: 0.1,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 663,
                        sigmaY: 663,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF2A81BF)),
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF2A81BF),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0.8, 0, 0, 7),
                                child: Text(
                                  'Minhas Ali',
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF403F3F),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0x332A81BF),
                                  ),
                                  child: Container(
                                    width: 210,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0.4, 0, 0, 7),
                                child: Text(
                                  '71501-2543546-5',
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF403F3F),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0x332A81BF),
                                  ),
                                  child: Container(
                                    width: 210,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0.7, 9),
                                child: Text(
                                  'New Hussain Abad Danyore',
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF403F3F),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0x332A81BF),
                                  ),
                                  child: Container(
                                    width: 210,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(1.8, 0, 0, 7),
                                child: Text(
                                  '03554938188',
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF403F3F),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0x332A81BF),
                                  ),
                                  child: Container(
                                    width: 210,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(1.9, 0, 0, 7),
                                child: Text(
                                  'Male',
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF403F3F),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0x332A81BF),
                                  ),
                                  child: Container(
                                    width: 210,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0.2, 0, 0, 0),
                                child: Text(
                                  '22 years old',
                                  style: GoogleFonts.getFont(
                                    'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF403F3F),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(1, 0, 0, 89),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A81BF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      width: 275,
                      padding: const EdgeInsets.fromLTRB(0, 14, 0.4, 14),
                      child:
                      Text(
                        'SEND DETAILS',
                        style: GoogleFonts.getFont(
                          'Quicksand',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(2, 0),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(19, 23.1, 20.5, 30.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0.5, 0, 0.5),
                        width: 30,
                        height: 30,
                        child:
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.network(
                            'assets/vectors/icon_158_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0.5, 0, 0.5),
                        width: 30,
                        height: 30,
                        child:
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.network(
                            'assets/vectors/icon_183_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child:
                        SizedBox(
                          width: 29.6,
                          height: 25,
                          child: SvgPicture.network(
                            'assets/vectors/vector_118_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 1.3, 0, 1.3),
                        width: 30,
                        height: 30,
                        child:
                        SizedBox(
                          width: 21,
                          height: 22.5,
                          child: SvgPicture.network(
                            'assets/vectors/icon_218_x2.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
