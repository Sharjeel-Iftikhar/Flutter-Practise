import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class categoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  const categoryCard({Key? key, required this.imagePath, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[100],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height:100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10,),
            Text(categoryName),
          ],

        ),
      ),
    );
  }
}
