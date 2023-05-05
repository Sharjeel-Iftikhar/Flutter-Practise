import 'package:finalmad/screens/tasks/task4/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class task4 extends StatefulWidget {
  const task4({Key? key}) : super(key: key);

  @override
  State<task4> createState() => _task4State();
}

class _task4State extends State<task4> {



  Future<void> initalize ()async {
    await Firebase.initializeApp().then((value)=>Get.put(AuthController()));
  }


  @override
  void initState() {
    initalize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
