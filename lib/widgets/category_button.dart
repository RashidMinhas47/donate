import 'package:feedonations/common/common_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton(
      {super.key, required this.label,  this.isEnabled = false, required this.color});
  final String label;
  final Color color;
  bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UtilFus.getSSize(context).width*0.2,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.getFont(
              'Quicksand',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: -0.3,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
