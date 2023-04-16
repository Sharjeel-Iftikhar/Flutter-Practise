import 'package:crud_with_sqflite/View/insert.dart';
import 'package:crud_with_sqflite/View/view_all.dart';
import 'package:crud_with_sqflite/db/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await sql_helper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crud with Sqflite',
      debugShowCheckedModeBanner: false,
      home: view_all(),
    );
  }
}



