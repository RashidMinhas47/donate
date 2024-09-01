import 'package:feedonations/Components/home_app_bar.dart';
import 'package:feedonations/Components/team_member_card.dart';
import 'package:feedonations/Components/top_app_bar.dart';
import 'package:feedonations/Constant/app_data.dart';
import 'package:feedonations/Constant/constants.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // iphone14plus10pZT (146:4)
        padding: const EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 0.2 * 1),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(30 * 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopAppBarWithTitle(
              title: 'About Us',
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                    23.61 * 1, 12.87 * 1, 24.39 * 1, 41.73 * 1),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // group1000003954Az1 (146:16)
                      margin: const EdgeInsets.fromLTRB(
                          130.39 * 1, 0 * 1, 129.61 * 1, 26.4 * 1),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.9534873962 * 1),
                      ),
                      child: Center(
                        // rectangle22791VWV (146:17)
                        child: SizedBox(
                          width: 120 * 1,
                          height: 118.6 * 1,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(13.9534873962 * 1),
                            child: Image.asset(
                              AppImages.logoIcon,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // group1000003966oXB (148:518)
                      margin: const EdgeInsets.fromLTRB(
                          0.78 * 1, 0 * 1, 0 * 1, 27 * 1),
                      width: 379 * 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                                0 * 1, 0 * 1, 0 * 1, 5 * 1),
                            child: Text(
                              'Meet our team',
                              style: GoogleFonts.quicksand(
                                fontSize: 24 * 1,
                                fontWeight: FontWeight.w700,
                                height: 1.25 * 1 / 1,
                                color: const Color.fromARGB(255, 18, 24, 58),
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 379 * 1,
                            ),
                            child: Text(
                              teamDescription,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                fontSize: 14 * 1,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * 1 / 1,
                                color: const Color(0xff3a3a3a),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        // margin:
                        //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        height: 200,
                        width: size.width,
                        child: PageView.builder(
                          itemCount: memberCardInfo.length,
                          itemBuilder: (_, index) => TeamMemberCard(
                              imageUrl: memberCardInfo[index][IMAGEURL],
                              name: memberCardInfo[index][NAME],
                              jobTitle: memberCardInfo[index][JOBTITLE],
                              jobDescription: memberCardInfo[index]
                                  [JOBDESCRIPTION]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> memberCardInfo = [
  {
    NAME: 'RASHID HUSSAIN',
    JOBTITLE: 'FOUNDER & MARKETING EXPERT',
    JOBDESCRIPTION: "As the founder and marketing expert at Donate, I lead our mission to revolutionize charitable giving. Through strategic campaigns and innovative outreach, we connect donors with causes they care about. Join us in making a difference, one donation at a time.",
    IMAGEURL: AppImages.rashidHussain
  },
  {
    NAME: 'RASHID MINHAS SHEIKH',
    JOBTITLE: 'CO-FOUNDER & DEVELOPMENT',
    JOBDESCRIPTION:
        "Proud co-founder and developer of Donate app, dedicated to simplifying and enhancing charitable giving. Our platform empowers users to support causes they're passionate about with ease. Join us in making a difference, one donation at a time.",
    IMAGEURL: AppImages.rashidMinhas
  },
  {
    NAME: 'JAHANGIR ALI',
    JOBTITLE: 'UI & UX DESIGNER',
    JOBDESCRIPTION: 'Lead uiux designe at Figma, Pitch, and Protocol Labs.',
    IMAGEURL: AppImages.jahangirAli
  },
];
