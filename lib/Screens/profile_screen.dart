import 'package:feedonations/Components/top_app_bar.dart';
import 'package:feedonations/Screens/sign_up.dart';
import 'package:feedonations/screen/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/homescreen_provider.dart';
import '../Routes/routes.dart';
import '../Utilis/app_colors.dart';
import 'Donations.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
           const  TopAppBarWithTitle(title: "Settings"),
          const SizedBox(height: 10,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                height: 180,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColor.profileContainerBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Container(
                  child: Column(
                    children: [
                      ProfileDetails(
                        iconData: Icons.person,
                        text: 'Edit Profile',
                        onTap: () {
                          RoutingPage.gotoNextPage(
                              context: context,
                              gotoNextPage: const EditProfileScreen());
                        },
                      ),
                      ProfileDetails(
                        iconData: Icons.security,
                        text: "Security",
                        onTap: () {},
                      ),
                      ProfileDetails(
                        iconData: Icons.notifications,
                        text: "Notifications",
                        onTap: () {},
                      ),
                    ],
                  ),
                )),
            const ProfileText(
              text: 'Support And About',
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                height: 160,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColor.profileContainerBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    ProfileDetails(
                      iconData: Icons.workspace_premium,
                      text: 'My Subscriptions',
                      onTap: () {},
                    ),
                    ProfileDetails(
                      iconData: Icons.contact_support_outlined,
                      text: "Help and Support",
                      onTap: () {},
                    ),
                  ],
                )),
            const ProfileText(
              text: "Actions",
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                height: 85,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: AppColor.profileContainerBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    ProfileDetails(
                      iconData: Icons.login_outlined,
                      text: "LogOut",
                      onTap: () async {
                        _showLogoutConfirmationDialog(context);
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Log Out Confirmation',style: GoogleFonts.poppins(),),
          content:  Text('Are you sure you want to log out?',style: GoogleFonts.poppins(),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'No',
                style: GoogleFonts.poppins(fontSize: 17, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                RoutingPage.gotoNextPage(
                    context: context, gotoNextPage:const AuthScreen());
              },
              child: Text(
                'Yes',
                style: GoogleFonts.actor(fontSize: 16, color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key, required this.iconData, required this.text, required this.onTap});
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
     title:  Text(text,style: GoogleFonts.poppins(),),
      onTap: onTap,

    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(),);
  }
}
