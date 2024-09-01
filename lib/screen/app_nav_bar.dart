import 'dart:developer';

import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Provider/profilescreenprovider.dart';
import 'package:feedonations/Screens/edit_profile_screen.dart';
import 'package:feedonations/Screens/profile_screen.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/screen/about_screen.dart';
import 'package:feedonations/screen/help_screen.dart';
import 'package:feedonations/screen/home_screen.dart';
import 'package:feedonations/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  void initState() {
    super.initState();
    notificationHandler();
  }

  void notificationHandler() {
    FirebaseMessaging.onMessage.listen((message) async {
      log(message.notification!.title!);
      await LocalNotificationService().showNotification(message);
    });
  }

  List<Widget> screens = const [
    HomeScreen(),
    HelpScreen(),
    AboutUsScreen(),
    ProfileScreen()
  ];
  int currentRoute = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens.elementAt(currentRoute),
        bottomNavigationBar: SalomonBottomBar(
          selectedItemColor: kPrimaryColor,

            currentIndex: currentRoute,
            onTap: (index) {
              setState(() {
                currentRoute = index;
              });
            },
            // mouseCursor: MouseCursor.uncontrolled,
            // type: BottomNavigationBarType.fixed,
            // enableFeedback: false,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            items: [
              SalomonBottomBarItem(
                title: Text("Home",style: GoogleFonts.poppins(),),
                icon: SvgPicture.asset(
                  AppSvg.homeIcon,
                  height: 29,
                  color:
                      currentRoute == 0 ? kPrimaryColor : kDefaultIconDarkColor,
                ),
              ),
              SalomonBottomBarItem(
                title: Text("Help Center",style: GoogleFonts.poppins(),),
                icon: SvgPicture.asset(
                  AppSvg.phoneIcon,
                  height: 29,
                  color:
                      currentRoute == 1 ? kPrimaryColor : kDefaultIconDarkColor,
                ),
              ),
              SalomonBottomBarItem(
                title: Text("Team",style: GoogleFonts.poppins(),),
                icon: SvgPicture.asset(
                  AppSvg.teamIcon,
                  height: 29,
                  color:
                      currentRoute == 2 ? kPrimaryColor : kDefaultIconDarkColor,
                ),
              ),
              SalomonBottomBarItem(
                title: Text("Profile",style: GoogleFonts.poppins(),),
                icon: SvgPicture.asset(
                  AppSvg.userIcon,
                  height: 29,
                  color:
                      currentRoute == 3 ? kPrimaryColor : kDefaultIconDarkColor,
                ),
              )
            ]),
      ),
    );
  }
}
