import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailedCard extends StatelessWidget {
  const ProfileDetailedCard({super.key, required this.name, required this.address, required this.donated, required this.profession, required this.imageUrl});
  final String name;
  final String address;
  final String donated;
  final String profession;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFFFFFFFF),
        boxShadow:const [
           BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Container(
        padding:
        const EdgeInsets.fromLTRB(10, 10, 10, 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(
                  0, 0, 0, 6.1),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xE51273B8)),
                borderRadius:
                BorderRadius.circular(7),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'assets/images/frame_4.png',
                  ),
                ),
              ),
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4+1),
                  child: Container(
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          imageUrl,
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      width: 129,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(
                  0, 0, 2, 0),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, 0, 13.4, 3.3),
                    child: Text(
                      name,
                      style: GoogleFonts.getFont(
                        'Quicksand',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color:
                        const Color(0xFF12183A),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, 0, 0, 2.3),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Opacity(
                        opacity: 0.49,
                        child: Text(
                          address,
                          style:
                          GoogleFonts.getFont(
                            'Quicksand',
                            fontWeight:
                            FontWeight.w600,
                            fontSize: 10,
                            color: const Color(
                                0xFF9E9E9E),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                        0, 0, 0, 3.3),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets
                              .fromLTRB(
                              0, 1.5, 0, 1.5),
                          child: Text(
                            'Donated',
                            style:
                            GoogleFonts.getFont(
                              'Quicksand',
                              fontWeight:
                              FontWeight.w500,
                              fontSize: 10,
                              height: 1,
                              color: const Color(
                                  0xFF9E9E9E),
                            ),
                          ),
                        ),
                        Text(
                          donated,
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            fontWeight:
                            FontWeight.w500,
                            fontSize: 10,
                            color: const Color(
                                0xFF12183A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    profession,
                    style: GoogleFonts.getFont(
                      'Quicksand',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      height: 1,
                      color:
                      const Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
