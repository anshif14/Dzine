import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xfashion/common/constants/imageConstants.dart';

import '../../../common/constants/Pallete.dart';
import '../../../main.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final StateProvider<bool> obscureProvider = StateProvider((ref) => false);
  final StateProvider<bool> privacyCheckProvider = StateProvider((ref) => false);

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create Account",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                "Fill your information below or\nRegister with your social Account",
                style: TextStyle(color: Colors.grey),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Name"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color:Colors.grey, width: 0.4)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2, 12, 2),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        // hintText: 'Enter your password',
                        hintStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Email"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color:Colors.grey, width: 0.4)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2, 12, 2),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        // hintText: 'Enter your password',
                        hintStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Phone"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color:Colors.grey, width: 0.4)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2, 12, 2),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      prefixText: "+91   ",

                        hintText: 'Enter your phone number',
                        // hintText: 'Enter your password',
                        hintStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Text("Password"),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey, width: 0.4)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2, 12, 2),
                  child: TextFormField(
                    obscureText: ref.watch(obscureProvider),
                    controller: passwordController,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(

                          // enableFeedback: true,
                            onTap: () {
                              ref.watch(obscureProvider.notifier).state = ! ref.watch(obscureProvider);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  ref.watch(obscureProvider)?
                                  imageConstants.eye:
                                  imageConstants.eye_off
                              ),
                            )),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      // shape:,

                      fillColor: MaterialStatePropertyAll(Colors.white),
                      checkColor: Pallete.brownPrimary,
                      value: ref.watch(privacyCheckProvider), onChanged: (value) {
                      ref.watch(privacyCheckProvider.notifier).state = value!;
                    },)
                  ],
                ),
              ),

              InkWell(
                onTap: () {



                  // Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpScreen(),));
                },
                child: Container(
                  width: width * 0.8,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      color: Pallete.brownPrimary,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
