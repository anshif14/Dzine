import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:xfashion/main.dart';

import '../../../common/constants/Pallete.dart';
import 'complete_profile.dart';

class otpScreen extends StatefulWidget {
  final String phoneNumber;
  const otpScreen({super.key, required this.phoneNumber});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle
            ),
          ),
        ),
      ),
      
      body: Center(
        child: Column(
          
          children: [
            SizedBox(
              height: height*0.05,
              
            ),
            Text("Verify Code",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
            Text("Please enter code that send to phone number", style: TextStyle(color: Colors.grey, fontSize: 12),),
            Text(widget.phoneNumber, style: TextStyle(color: Colors.brown, fontSize: 15),),
            SizedBox(height: 20,),
            Pinput(

              length: 6,
              controller:otpController ,
            ),
            SizedBox(height: 25,),
            Text("Didn't recieve OTP?", style: TextStyle(color: Colors.grey, fontSize: 12),),
            SizedBox(height: 10,),

            Text('Resend code', style: TextStyle(color: Colors.brown, fontSize: 15,decoration: TextDecoration.underline),),
SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
Navigator.push(context, CupertinoPageRoute(builder: (context) => completeProfile(),));
                },
                child: Container(
                  width: width * 0.8,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      color: Pallete.brownPrimary,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
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
