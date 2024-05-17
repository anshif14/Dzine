

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xfashion/common/constants/imageConstants.dart';
import 'package:xfashion/features/auth/screens/signUpScreens.dart';
import 'package:xfashion/main.dart';

import '../../../common/constants/Pallete.dart';

class signInScreen extends ConsumerStatefulWidget {
  const signInScreen({super.key});

  @override
  ConsumerState<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends ConsumerState<signInScreen> {
// Provider obscureProvider = Provider((ref) => null)

final StateProvider<bool> obscureProvider = StateProvider((ref)=>false);

final StateProvider <bool> emailValidationProvider = StateProvider((ref) => false);
final StateProvider <bool> passwordValidationProvider = StateProvider((ref) => false);


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ElevatedButton(
                //     onPressed: () {
                //       ref.watch(obscureProvider.notifier).state =
                //           !ref.watch(obscureProvider);
                //       print(ref.read(obscureProvider));
                //       print("1234567890");
                //     },
                //     child: Text("obsure")),
                SizedBox(
                  height: height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Text(
                  "Hi! Welcome back, you've been missed",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  children: [
                    Text("Email"),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Forgot Password",
            
            
                        style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.brown
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
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
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
            SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 0.5,
                      width: width*0.3,

                    ),
                    Text("OR"),
                    Container(
                      color: Colors.grey,
                      height: 0.5,
                      width: width*0.3,

                    ),
                  ],
                ),

                SizedBox(height:20 ,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
               Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(child: SvgPicture.asset(imageConstants.apple,height: height*0.04,)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(child: SvgPicture.asset(imageConstants.google,height: height*0.04,)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(child: SvgPicture.asset(imageConstants.facebook,height: height*0.04,)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    InkWell(
                      onTap:  () {
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) =>SignUpScreen(),));

                      },
                      child: Text(
                        "Sign Up",
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
          ),
        ),
      ),
    );
  }
}
