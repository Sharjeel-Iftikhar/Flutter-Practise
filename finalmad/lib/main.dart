import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:finalmad/screens/home_screen.dart';

import 'package:finalmad/screens/tasks/task4/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalmad/screens/tasks/task8/db/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async {
  final String email;
  WidgetsFlutterBinding.ensureInitialized();
  await sql_helper.initDb();
  await Firebase.initializeApp();
  // await sql_helper.initDb();
  //.then((value)=>Get.put(AuthController()));
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notfication channel for basic tests')
    ],
    debug: true,
  );
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: home_screen(),
  ));
}
