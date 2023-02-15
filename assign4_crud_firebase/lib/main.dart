import 'package:assign4_crud_firebase/auth_controller.dart';
import 'package:assign4_crud_firebase/register.dart';
import 'package:assign4_crud_firebase/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value)=>Get.put(AuthController()));
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'signin',
    routes: {
      'signin': (context) => Signin(),
      'register':(context)=> register(),
    },
  ));
}
