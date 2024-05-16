import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:introduction_screen/introduction_screen.dart';
import 'package:xfashion/common/constants/Pallete.dart';
import 'package:xfashion/features/auth/screens/welcomeScreen.dart';
import 'package:xfashion/main.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: OnBoardingSlider(
            // hasFloatingButton: true,
            onFinish: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                  (route) => false);
            },
            finishButtonText: "Go!",
            hasSkip: true,
            addController: true,
            controllerColor: Pallete.brownPrimary,
            finishButtonStyle: const FinishButtonStyle(
              shape: CircleBorder(),
              backgroundColor: Pallete.brownPrimary,
            ),
            indicatorAbove: true,
            addButton: true,
            skipTextButton: const Text(
              "Skip",
              style: TextStyle(color: Pallete.brownPrimary),
            ),
            totalPage: 3,
            headerBackgroundColor: Colors.white,
            background: [
              CachedNetworkImage(
              imageUrl:   'https://mediaslide-us.storage.googleapis.com/imgmodels/news_pictures/2022/10/large-1666270670-af7799f309b040a17e54fdbe24e83bce.jpg',
                height: height * 0.6,
                width: width,
                fit: BoxFit.cover,
              ),
              CachedNetworkImage(imageUrl:
                'https://i.pinimg.com/736x/b1/c4/6b/b1c46b8badd697f84a2a9ccd10193340.jpg',
                height: height * 0.6,
                width: width,
                fit: BoxFit.cover,
              ),
              CachedNetworkImage(imageUrl:
                "https://mediaslide-us.storage.googleapis.com/imgmodels/news_pictures/2022/10/large-1666270672-7760e9757bb20409006827097590db63.jpg",
                height: height * 0.6,
                width: width,
                fit: BoxFit.cover,
              ),
            ],
            speed: 1.8,
            pageBodies: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.6,
                    ),
                    Column(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Seamless',
                            style: GoogleFonts.poppins(
                                color: Pallete.brownPrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' Shopping',
                            style: GoogleFonts.poppins(
                                color: Pallete.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          )
                        ])),
                        Text(
                          "Experience",
                          style: GoogleFonts.poppins(
                              color: Pallete.primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Welcome to your style profile! Tell us about your fashion sense to discover clothes you'll love.",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.6,
                    ),
                    Column(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Wishlist:',
                            style: GoogleFonts.poppins(
                                color: Pallete.brownPrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' Where Fashion',
                            style: GoogleFonts.poppins(
                                color: Pallete.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          )
                        ])),
                        Text(
                          "Dreams Begin",
                          style: GoogleFonts.poppins(
                              color: Pallete.primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "No more shopping struggles! We'll curate your closet with styles you crave, right at your fingertips.",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.6,
                    ),
                    Column(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Swift ',
                            style: GoogleFonts.poppins(
                                color: Pallete.brownPrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' and Reliable',
                            style: GoogleFonts.poppins(
                                color: Pallete.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          )
                        ])),
                        Text(
                          "Delivery",
                          style: GoogleFonts.poppins(
                              color: Pallete.primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "No more shopping struggles! We'll curate your closet with styles you crave, right at your fingertips.",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
              ),
            ]));
  }
}
// IntroductionScreen(
// bodyPadding: EdgeInsets.zero,
// allowImplicitScrolling: true,
// skip: Text("Skip",style: TextStyle(
// color: Pallete.brownPrimary
// ),),
// showSkipButton: true,
//
//
// pages: [
// PageViewModel(
//
// titleWidget:
// Column(
// children: [
// RichText(
// text: TextSpan(children: [
// TextSpan(
// text: 'Seamless',
// style: GoogleFonts.poppins(
// color: Pallete.brownPrimary,
// fontSize: 22,
// fontWeight: FontWeight.w600),
// ),
// TextSpan(
// text: ' Shopping',
// style: GoogleFonts.poppins(
// color: Pallete.primaryColor,
// fontSize: 22,
// fontWeight: FontWeight.w400),
// )
// ])),
// Text(
// "Experience",
// style: GoogleFonts.poppins(
// color: Pallete.primaryColor,
// fontSize: 22,
// fontWeight: FontWeight.w400),
// )
// ],
// ),
// body:
// "Welcome to your style profile! Tell us about your fashion sense to discover clothes you'll love.",
// image:Container(
// height: height,
// width: width,
// decoration: BoxDecoration(
// image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/22757194/pexels-photo-22757194/free-photo-of-woman-and-man-standing-behind-car-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),fit: BoxFit.cover)
// ),
// ),
// decoration: const PageDecoration(pageColor: Colors.white),
// ),
// PageViewModel(
// title: "Title of blue page",
// body:
// "Welcome to the app! This is a description on a page with a blue background.",
// image: Center(
// child:
// Image.network("https://example.com/image.png", height: 175.0),
// ),
// decoration: const PageDecoration(
// pageColor: Colors.blue,
// ),
// )
// ],
// showNextButton: false,
// done: const Text("Done"),
// onDone: () {
// // On button pressed
// },
// ),
