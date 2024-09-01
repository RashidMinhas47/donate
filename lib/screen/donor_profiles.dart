import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedonations/Components/top_app_bar.dart';
import 'package:feedonations/screen/components/profile_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constant/constants.dart';
import '../widgets/category_button.dart';

class DonorProfiles extends StatefulWidget {
  const DonorProfiles({super.key});

  @override
  State<DonorProfiles> createState() => _DonorProfilesState();
}

class _DonorProfilesState extends State<DonorProfiles>
    with SingleTickerProviderStateMixin {
  List<String> tabTitles = ["Education", "Medical", "Wish", "More"];
  TabController? tabController;
  final PageController _pageController = PageController();

  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        length: tabTitles.length, vsync: this, initialIndex: currentIndex);
  }

  Stream<List<DocumentSnapshot>> fetchDonorData(String docId) {
    return FirebaseFirestore.instance
        .collection(REQUESTS)
        .doc(docId)
        .collection(DONORREQUESTS)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DonorProfilePage(
        stream: fetchDonorData(EDUCATION),
      ),
      DonorProfilePage(
        stream: fetchDonorData(MEDICAL),
      ),
      DonorProfilePage(
        stream: fetchDonorData(WISH),
      ),
      DonorProfilePage(
        stream: fetchDonorData(MORE),
      ),
    ];
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 13.2, 0, 0.2),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopAppBarWithTitle(title: "Donor's"),
                  TabBar(
                    dividerHeight: 0,
                    indicatorColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    physics: const PageScrollPhysics(),
                    tabs: [
                      for (int i = 0; i < tabTitles.length; i++)
                        CategoryButton(
                          label: tabTitles[i],
                          color: currentIndex == i
                              ? const Color(0xFF2A81BF)
                              : const Color(0x7E9E9E9E),
                        )
                    ],
                    controller: tabController,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                        _pageController.jumpToPage(index);
                      });
                    },
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics:const  NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return pages.elementAt(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

// Container(
//   margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//   height: 34,
//   child: Align(
//     alignment: Alignment.topLeft,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//             child:
//         )
//         // SizedBox(
//         //   width: 281.2,
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     crossAxisAlignment: CrossAxisAlignment.start,
//         //     children: [
//         //       Container(
//         //         decoration: BoxDecoration(
//         //           color: const Color(0x47CCC9C9),
//         //           borderRadius: BorderRadius.circular(4),
//         //         ),
//         //         child: Container(
//         //           padding: const EdgeInsets.fromLTRB(4, 6, 6.5, 6),
//         //           child:
//         //           Text(
//         //             'Clothes',
//         //             style: GoogleFonts.getFont(
//         //               'Quicksand',
//         //               fontWeight: FontWeight.w600,
//         //               fontSize: 16,
//         //               letterSpacing: -0.3,
//         //               color: const Color(0xFF1F1E1F),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //       Container(
//         //         decoration: BoxDecoration(
//         //           color: const Color(0x47CCC9C9),
//         //           borderRadius: BorderRadius.circular(4),
//         //         ),
//         //         child: Container(
//         //           padding: const EdgeInsets.fromLTRB(4, 6, 6.2, 6),
//         //           child:
//         //           Text(
//         //             'Medicines',
//         //             style: GoogleFonts.getFont(
//         //               'Quicksand',
//         //               fontWeight: FontWeight.w600,
//         //               fontSize: 16,
//         //               letterSpacing: -0.3,
//         //               color: const Color(0xFF1F1E1F),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //       Container(
//         //         child:
//         //         Container(
//         //           decoration: BoxDecoration(
//         //             color: const Color(0x47CCC9C9),
//         //             borderRadius: BorderRadius.circular(4),
//         //           ),
//         //           child: Container(
//         //             padding: const EdgeInsets.fromLTRB(4, 6, 6.3, 6),
//         //             child:
//         //             Text(
//         //               'Money',
//         //               style: GoogleFonts.getFont(
//         //                 'Quicksand',
//         //                 fontWeight: FontWeight.w600,
//         //                 fontSize: 16,
//         //                 letterSpacing: -0.3,
//         //                 color: const Color(0xFF1F1E1F),
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//       ],
//     ),
//   ),
// ),