
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'APIView.dart';
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
      Get.off(Signin());
      //Get.offAll(()=>const Signin());
    }else{
      print(user);
      print('Hello');
      print(user.email.toString());
      Get.off(APIView(email:user.email!));
      //Get.offAll(()=>APIView(email:user.email!));
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
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

