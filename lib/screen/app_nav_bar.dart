import 'package:feedonations/Provider/profilescreenprovider.dart';
import 'package:feedonations/Screens/edit_profile_screen.dart';
import 'package:feedonations/Screens/profile_screen.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/screen/about_screen.dart';
import 'package:feedonations/screen/help_screen.dart';
import 'package:feedonations/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  List<Widget> screens = const [
    HomeScreen(),
    HelpScreen(),
    AboutUsScreen(),
    PorfileScreen()
  ];
  int currentRoute = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens.elementAt(currentRoute),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentRoute,
            onTap: (index) {
              setState(() {
                currentRoute = index;
              });
            },
            mouseCursor: MouseCursor.uncontrolled,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppSvg.homeIcon,
                    height: 29,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppSvg.phoneIcon,
                    height: 29,
                  ),
                  label: 'help center'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppSvg.teamIcon,
                    height: 29,
                  ),
                  label: 'team'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppSvg.userIcon,
                    height: 29,
                  ),
                  label: 'profile')
            ]),
      ),
    );
  }
}
