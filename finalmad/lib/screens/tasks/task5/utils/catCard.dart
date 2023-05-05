import 'package:flutter/material.dart';

class catCard extends StatelessWidget {
  final String catImagePath;
  final String catRating;
  final String catName;

  const catCard(
      {super.key,
        required this.catName,
        required this.catImagePath,
        required this.catRating});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    catImagePath,
                    height: 100,
                    // width: 100,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Text(catRating),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  catName,
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            )),
      ),
    );
  }
}
