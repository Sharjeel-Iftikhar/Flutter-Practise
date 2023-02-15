import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'APIView.dart';
import 'auth_controller.dart';

class drawerHeader extends StatefulWidget {
  final String em;
  drawerHeader({Key? key,required this.em}) : super(key: key);

  @override
  State<drawerHeader> createState() => _drawerHeaderState();
}

class _drawerHeaderState extends State<drawerHeader> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[300],
      width: double.infinity,
      height: 0,
      padding: EdgeInsets.only(top: 90.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/profile1.png'),
                ),
              ),
            ),
            Text(
              "Amegios",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              widget.em,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            drawerList(),
            Container(
              width: 200,
              child: Card(
                child: GestureDetector(
                  onTap: (){
                    Get.offAll(()=>APIView(email: widget.em));
                  },
                  child: ListTile(
                    leading: Icon(Icons.arrow_back),
                    contentPadding: EdgeInsets.only(left: 30),
                    title:Text('BAck'),
                  ),
                ),
              ),
            )

          ],

        ),
      ),
    );
  }
}

Widget drawerList(){
  return Container(
    width: 200,
    margin: EdgeInsets.only(top:100),
    padding: EdgeInsets.only(top:140),
    child: Column(
      children: [
        Card(
          child: GestureDetector(
            onTap: (){
              AuthController.instance.logout();
            },
            child: ListTile(
              leading: Icon(Icons.arrow_circle_left_sharp),
              contentPadding: EdgeInsets.only(left: 30),
              title:Text('Log out'),


            ),
          ),
        ),
      ],
    ),
  );
}
