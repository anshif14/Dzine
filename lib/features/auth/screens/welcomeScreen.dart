import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xfashion/features/auth/screens/signInScreen.dart';
import 'package:xfashion/features/auth/screens/signUpScreens.dart';
import 'package:xfashion/main.dart';

import '../../../common/constants/Pallete.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          Stack(
            children: [
              Container(
                // color: Colors.grey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.45,
                      width: width * 0.4,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  'https://images.pexels.com/photos/23719800/pexels-photo-23719800/free-photo-of-two-men-in-black-suits-and-sunglasses-are-standing-next-to-a-motorcycle.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(150)),
                          color: Colors.black12),
                    ),
                    SizedBox(
                      height: height * 0.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.23,
                              width: width * 0.4,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          'https://images.pexels.com/photos/20867011/pexels-photo-20867011/free-photo-of-woman-in-gray-jeans-and-gray-crop-top.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(150)),
                                  color: Colors.black12),
                            ),
                          ),
                          Container(
                            height: height * 0.22,
                            width: width * 0.4,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        'https://images.pexels.com/photos/3335344/pexels-photo-3335344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                    fit: BoxFit.cover),
                                // borderRadius: BorderRadius.all(Radius.circular(150)),
                                color: Colors.black12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                  bottom: 30,
                  left: 20,
                  child: Text(
                    "*",
                    style: TextStyle(fontSize: 70),
                  ))
            ],
          ),
          Column(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'The ',
                  style: GoogleFonts.poppins(
                      color: Pallete.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'Fashion App ',
                  style: GoogleFonts.poppins(
                      color: Pallete.brownPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'That',
                  style: GoogleFonts.poppins(
                      color: Pallete.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                )
              ])),
              Text(
                "Makes You Look Your Best",
                style: GoogleFonts.poppins(
                    color: Pallete.primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Welcome to your style profile! Tell us about your fashion sense to discover clothes you'll love.",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpScreen(),));
            },
            child: Container(
              width: width * 0.8,
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: Pallete.brownPrimary,
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  "Let's Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? "),
              InkWell(
                onTap:  () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => signInScreen(),));

                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Pallete.brownPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
