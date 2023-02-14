import 'package:assign2/APIView.dart';
import 'package:flutter/material.dart';
import 'package:assign2/fargot.dart';
import 'package:assign2/accounts.dart';
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'fargot',
    routes: {
      'fargot':(context) => fargotScreen(),
      'accountpage':((context)=> accountscreen()),
      'apiview' : ((context)=> APIView())
    },
  ));
}

