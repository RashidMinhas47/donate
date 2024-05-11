import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Routes/routes.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/screen/donor_form.dart';
import 'package:feedonations/screen/receiver_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

List<Map<String, dynamic>> categories = [
  {TITLE: 'Education', IMAGEURL: AppSvg.educationIcon, CATEGORY: EDUCATION},
  {TITLE: 'Medical', IMAGEURL: AppSvg.medicalIcon, CATEGORY: MEDICAL},
  {TITLE: 'Wish', IMAGEURL: AppSvg.heartIcon, CATEGORY: WISH},
  {TITLE: 'More', IMAGEURL: AppSvg.categoryIcon, CATEGORY: MORE}
];

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // frame1Mky (11:60)
      margin: EdgeInsets.fromLTRB(23.61 * 1, 10 * 1, 24.39 * 1, 32 * 1),
      padding: EdgeInsets.fromLTRB(24.03 * 1, 13.99 * 1, 24.03 * 1, 13.99 * 1),
      width: double.infinity,
      height: 110 * 1,
      decoration: BoxDecoration(
        color: Color(0x0c1273b8),
        borderRadius: BorderRadius.circular(20 * 1),
      ),
      child: Container(
        // group1000003905sDX (12:244)
        width: double.infinity,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < categories.length; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Forms'),
                          content: const Text(
                              'you can navigate donor or receiver form here'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                RoutingPage.gotoNextPage(
                                    context: context,
                                    gotoNextPage: DonorForm(
                                      getCateGory: categories[i][CATEGORY],
                                    ));
                                // Code to navigate to screen 1 goes here
                              },
                              child: const Text('Donor Form'),
                            ),
                            TextButton(
                              onPressed: () {
                                RoutingPage.gotoNextPage(
                                    context: context,
                                    gotoNextPage: ReceiverForm(
                                      getCategory: categories[i][CATEGORY],
                                    ));
                                // Code to navigate to screen 2 goes here
                              },
                              child: const Text('Receiver Form'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    // frame1000003911oN5 (12:237)
                    margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    width: 50,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group1000003902XJ5 (12:213)
                          margin:
                              const EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 0),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 27,
                              height: 27,
                              child: SvgPicture.asset(
                                categories[i][IMAGEURL],
                                width: 27,
                                height: 27,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            categories[i][TITLE],
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              color: Color(0xff505050),
                            ),
                          ),
                        ),
                      ],
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
