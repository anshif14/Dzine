import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xfashion/common/constants/Pallete.dart';
import 'package:xfashion/common/constants/imageConstants.dart';
import 'package:xfashion/features/auth/controller/auth_contoller.dart';
import 'package:xfashion/features/auth/repository/auth_repository.dart';
import 'package:xfashion/main.dart';
import 'dart:io';

class completeProfile extends ConsumerStatefulWidget {
  const completeProfile({super.key});

  @override
  ConsumerState<completeProfile> createState() => _completeProfileState();
}

class _completeProfileState extends ConsumerState<completeProfile> {

  List genders=[
    'Male',
    "Female",
    "Others"
  ];

  File? imageFile;

  final StateProvider <File?> imageFileProvider = StateProvider((ref) => null);


  pickFile(ImageSource source)async{
    var data =await ImagePicker.platform.getImageFromSource(source: source);
    ref.read(imageFileProvider.notifier).state = File(data!.path);

  ref.read(imageUrlProvider.notifier).state =   ref.watch(authRepositoryController).uploadImage(File(data!.path)) ;

  }
  
  final StateProvider<String> imageUrlProvider = StateProvider((ref) => 'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg');
  final StateProvider<String?> genderProvider = StateProvider((ref) => null);
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.back),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),

              const SizedBox(height: 20,),
              const Text("Complete Your Profile",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
              const SizedBox(height: 5,),

              const Text("Don't worry only you can see your personal\ndata.No one else will be able to see it.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),),
              const SizedBox(height: 30,),

              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      height: height*0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          InkWell(
                            onTap: () {
                              pickFile(ImageSource.camera);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(imageConstants.camera,height: height*0.1,),
                                const Text("Camera")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pickFile(ImageSource.gallery);

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(imageConstants.gallery,height: height*0.1,),
                                const Text("Gallery")
                              ],
                            ),
                          ),

                        ],
                      ),
                    );

                  },);
                },
                child: Stack(
                  children: [
                    Container(
                
                      child: Container(
                        height: width*0.35,
                        width: width*0.35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          image: DecorationImage(image: CachedNetworkImageProvider(ref.read(imageUrlProvider)),fit: BoxFit.cover),
                          shape: BoxShape.circle
                        ),
                      ),
                    ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallete.brownPrimary
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(imageConstants.edit,color: Colors.white,width: 20,),
                ),
                            ),
                          ),
                  ],
                ),
              )
          ,

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
              ),    const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Gender"),
                  ],
                ),
              ),
              Container(
                width: width,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color:Colors.grey, width: 0.4)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2, 12, 2),
                  child: DropdownButton(
                    hint:const Text( 'Gender'),
                    isExpanded: true,
                    underline: Container(),
                    value: ref.watch(genderProvider),

                    items: List.generate(genders.length, (index) =>
                      DropdownMenuItem(

                          value: genders[index],
                          child: Text(genders[index])),

                  ), onChanged: (value) {
                    ref.read(genderProvider.notifier).state = value.toString();
                  },)
                ),
              ),

              const SizedBox(height: 20,),
              InkWell(
                onTap: () {







                },
                child: Container(
                  width: width * 0.8,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      color: Pallete.brownPrimary,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "Complete Profile",
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
