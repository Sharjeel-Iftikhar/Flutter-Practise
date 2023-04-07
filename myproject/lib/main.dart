
import 'package:flutter/material.dart';
import 'package:myproject/theme.dart';

import 'screens/welcome.dart';

void main() {
  runApp(myApp());
}
  class myApp extends StatelessWidget {
    const myApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connectify',
  home: welcome(),
  theme: lightThemeData(context),
      );
    }
  }
