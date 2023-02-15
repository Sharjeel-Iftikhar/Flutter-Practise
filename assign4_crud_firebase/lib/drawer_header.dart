import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Text(
            widget.em,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
