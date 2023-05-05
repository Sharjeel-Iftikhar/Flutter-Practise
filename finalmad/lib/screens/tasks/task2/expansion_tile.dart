import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Color.fromARGB(255, 205, 236, 196),
        child: Column(
          children: const [
            ExpansionTile(
              title: Text('Expansion Title'),
              children: [
                ListTile(
                  title: Text('This is the number'),
                )
              ],
            )
          ],
        ),
    );
  }
}
