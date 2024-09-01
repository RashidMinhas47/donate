import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feedonations/Constant/color_scheme.dart';
import 'package:feedonations/Screens/sign_up.dart';
import 'package:feedonations/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilis/images.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // const Welcome({super.key});
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    CarouselSliderController buttonCarouselController = CarouselSliderController();
List<Widget> children = [
  Column(
    children: [
      SvgPicture.asset(AppSvg.welcomeImg1,height: 200,),
      const SizedBox(height: 20,),
      Text("Your Donations Your Way",style:GoogleFonts.inter(
          fontSize: 20,fontWeight: FontWeight.w500
      )),
    ],
  ),
  Column(
    children: [
      SvgPicture.asset(AppSvg.welcomeImg2,height: 200,),
      Text("Your Donations Your Way",style:GoogleFonts.inter(
          fontSize: 20,fontWeight: FontWeight.w500
      )),
    ],
  ),
  Column(
    children: [
      SvgPicture.asset(AppSvg.welcomeImg3,height: 200,),
      Text("Empower Your Generosity",style:GoogleFonts.inter(
          fontSize: 20,fontWeight: FontWeight.w500
      )),
    ],
  ),
];
    return Scaffold(
      body:Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            CarouselSlider(
              items: children,
              carouselController: _controller,
              options: CarouselOptions(
                  // autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.4,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                    Future.delayed(const Duration(seconds: 2),(){
                      _current == children.length-1 ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const AuthScreen())): null;

                    });
                  }),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? kPrimaryColor
                            : kPrimaryColor)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            // CarouselSlider(
            //   items: children,
            //   carouselController: buttonCarouselController,
            //
            //   options: CarouselOptions(
            //
            //     autoPlay: false,
            //     enlargeCenterPage: true,
            //     viewportFraction: 0.9,
            //     aspectRatio: 16/9,
            //     initialPage: 2,
            //   ),
            // ),
            // TextButton(
            //   onPressed: () => buttonCarouselController.nextPage(
            //       duration: Duration(milliseconds: 300), curve: Curves.linear),
            //   child: Text('→'),
            // )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.nextPage(duration:const Duration(milliseconds: 400));
        },child: Icon(Icons.navigate_next, color: Colors.white,),
        backgroundColor: kPrimaryColorLightShade,
      ),
    );

  }
}
