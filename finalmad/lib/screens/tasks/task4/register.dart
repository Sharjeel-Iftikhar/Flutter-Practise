import 'dart:io';
import 'auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height*0.9;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
               },
              child: Container(
                width: width,
                height: hei*0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'images/signup.png'
                      ),
                      fit: BoxFit.cover,
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: hei*0.2),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white70,
                      backgroundImage: AssetImage(
                          'images/profile1.png'
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.only(left: 27,right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  Center(
                    child: Text('Create New Account',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:[ BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        )]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                          prefixIcon: Icon(Icons.email,
                          color: Colors.deepOrangeAccent
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 14,),
                  Container(
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:[ BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        )]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password_outlined,
                              color: Colors.deepOrangeAccent
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: width*0.43,
              height: hei*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                        'images/loginbtn.png'
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: GestureDetector(
                onTap: (){
                  Get.put(AuthController());
                  AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                },
                child: Center(
                  child: Text('Sign Up',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            RichText(text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text: 'Have an account?',style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500],
              letterSpacing: 1.3,
            )

            )

            ),
            SizedBox(height: hei*0.07),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign up using one of the following method',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.put(AuthController());
                    AuthController.instance.signInWithGoogle();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white70,
                    backgroundImage: AssetImage(
                        'images/g.png'
                    ),
                  ),
                ),
                SizedBox(width: 11),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage(
                      'images/t.png'
                  ),
                ),
                SizedBox(width: 11),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage(
                      'images/f.png'
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
