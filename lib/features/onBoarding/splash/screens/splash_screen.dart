import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xfashion/features/onBoarding/onBoardingCarrousal/screens/onBoardingCarrousalScreen.dart';
import 'package:xfashion/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  rootNavigation(){
    Future.delayed(Duration(seconds: 1)).then((value) =>
        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: OnBoardingScreen()))


    );
  }

  void initState() {
    rootNavigation();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text(
          "Dzine",
          style: GoogleFonts.pacifico(
            fontSize:50
          ),
        ),
      ),
    );
  }
}
