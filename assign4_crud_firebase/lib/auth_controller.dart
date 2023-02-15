import 'package:assign4_crud_firebase/APIView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'signin.dart';

class AuthController extends GetxController{
  //AuthController..
  static AuthController instance = Get.find();
  //email, password..
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    _user =Rx<User?> (auth.currentUser);
    // user will be notified
    _user.bindStream(auth.userChanges());
    // _user is listener and _intialScreen is callback function
    // every time user log in or logout callback function will be called
    ever(_user,_initialScreen);
  }

  _initialScreen(User? user){
    if(user==null) {
      //print('login page');
      Get.offAll(()=>const Signin());
    }else{
      print(user);
      print('Hello');
      print(user.email.toString());
      Get.offAll(()=>APIView(email:user.email!));
    }
    }

    Future<void> register(String email ,password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar('About User', 'User message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text('Account Creation failed',
      style: TextStyle(
        color: Colors.white70,
      ),
      ),
        messageText: Text(e.toString(),
          style: const TextStyle(
            color: Colors.white70,
          ),
        )
      );
    }
    }
    Future<void> login(String email ,password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar('About Login', 'login message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Login failed',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          messageText: Text(e.toString(),
            style: const TextStyle(
              color: Colors.white70,
            ),
          )
      );
    }
  }
    Future<void> logout() async {
      auth.signOut();
    }
}

