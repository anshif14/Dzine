import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xfashion/common/constants/imageConstants.dart';
import 'package:xfashion/common/widgets/alert.dart';
import 'package:xfashion/features/auth/screens/otp_screen.dart';

import '../../../common/constants/Pallete.dart';
import '../../../main.dart';
import '../controller/auth_contoller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  Map<String,dynamic> termsData ={};



  getTerms()async{
termsData =await ref.read(authRepositoryController).getTerms();

print(termsData);
  return ref.read(authRepositoryController).getTerms();

  }

  final StateProvider<bool> obscureProvider = StateProvider((ref) => false);
  final StateProvider<bool> privacyCheckProvider = StateProvider((ref) => false);

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {

getTerms();

    // TODO: implement initState
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return PopScope(
     canPop: false,
      onPopInvoked: (didPop) async {
        bool pop = await  alert(context, 'You want to exit?');
        if(pop){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                     height: height * 0.08,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "Fill your information below or\nRegister with your social Account",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                        decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            // hintText: 'Enter your password',
                            hintStyle: TextStyle(fontSize: 13),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                        decoration: const InputDecoration(
                            hintText: 'example@gmail.com',
                            // hintText: 'Enter your password',
                            hintStyle: TextStyle(fontSize: 13),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                        decoration: const InputDecoration(
                          prefixText: "+91   ",

                            hintText: 'Enter your phone number',
                            // hintText: 'Enter your password',
                            hintStyle: TextStyle(fontSize: 13),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const Row(
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
                            hintStyle: const TextStyle(fontSize: 13),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          // shape:,

                          activeColor: Pallete.brownPrimary,
                          checkColor: Colors.white,
                          value: ref.watch(privacyCheckProvider), onChanged: (value) {
                          ref.watch(privacyCheckProvider.notifier).state = value!;
                        },),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(

                                
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              context: context, builder: (context) => termsBottomSheet(
                              data: termsData,
                            ),);
                          },
                          child: RichText(text: const TextSpan(children: [
                            TextSpan(text: "Agree with ",style: TextStyle(
                              color: Colors.black
                            )),
                            TextSpan(text: "Terms & Conditions",style: TextStyle(
                                color: Pallete.brownPrimary
                                    ,decoration: TextDecoration.underline
                            ))

                          ])),
                        )
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {






                        Navigator.push(context, CupertinoPageRoute(builder: (context) => otpScreen(
                          phoneNumber:phoneController.text==''?'+919847369963': "+91${phoneController.text}",
                        ),));
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// Widget  termsBottomSheet()=>
//
//     DraggableScrollableSheet(
//         initialChildSize: 0.7,
//         maxChildSize: 1,
//         minChildSize: 0.5,
//         builder: (context,controller) {
//           return ListView.builder(
//             controller: controller,
//             itemCount: 50,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('title'),
//               );
//             },);
//         }
//     );

class termsBottomSheet extends StatefulWidget {
  final Map data;
  const termsBottomSheet({super.key, required this.data});

  @override
  State<termsBottomSheet> createState() => _termsBottomSheetState();
}

class _termsBottomSheetState extends State<termsBottomSheet> {
  @override
  void initState() {

print(widget.data);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 1,
      minChildSize: 0.5,
      builder: (context,controller) {
        return Container(
decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12)
),


          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: width*0.3,decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  ),
                  ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    itemCount: widget.data['terms'].keys.toList().length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text((index+1).toString()),
                      title: Text(widget.data['terms'].keys.toList()[index],style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                      subtitle: Text(
                          widget.data['terms'][widget.data['terms'].keys.toList()[index]].toString()
                      ),
                    );
                  },),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

