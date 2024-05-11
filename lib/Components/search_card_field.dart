import 'package:feedonations/Utilis/theme_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCardField extends StatelessWidget {
  const SearchCardField({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // group43ztV (11:54)
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width,
      height: 52,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0 * 1, 6 * 1),
            blurRadius: 8 * 1,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // group42JPP (11:55)
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8 * 1),
        ),
        child: Container(
          alignment: Alignment.center,
          // group10000039321Yh (18:976)
          width: double.infinity,
          height: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: ThemeSchema.jostFont(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff999999)),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.445,
                    letterSpacing: -0.72 * 1,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(CupertinoIcons.search),
                color: Color(0xff999999),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
