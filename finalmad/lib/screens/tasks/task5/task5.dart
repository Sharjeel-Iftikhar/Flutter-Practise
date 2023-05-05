import 'package:finalmad/screens/tasks/task5/utils/person-card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'utils/catCard.dart';
import 'utils/categoryCard.dart';

class taskFive extends StatefulWidget {
  const taskFive({Key? key}) : super(key: key);

  @override
  State<taskFive> createState() => _taskFiveState();
}

class _taskFiveState extends State<taskFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello,",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize:24,
                      ),
                      ),
                      SizedBox(height: 8),
                      Text("Cute Pumpkin",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                  const personCard(),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left:  20,right: 20,top: 6),
              child: Container(
                padding: EdgeInsets.only(left: 0,top:10,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 150,height: 150,
                    child: Lottie.network(
                      "https://assets4.lottiefiles.com/packages/lf20_IJpMIV0zMj.json"),
                    ),
                    SizedBox(width: 0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'How do you feel?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Fill your medical information right now',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 150,
                            padding: const EdgeInsets.only(top: 15,bottom: 15),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(12.0)),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12)),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help you?',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 80,
                // decoration: const BoxDecoration(
                //   color: Colors.green,
                // ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    categoryCard(
                        imagePath: 'lib/screens/tasks/task5/images/icon1.png',
                        categoryName: 'Dentist'),
                    categoryCard(
                        imagePath: 'lib/screens/tasks/task5/images/icon2.jpg',
                        categoryName: 'Heart'),
                    categoryCard(
                        imagePath: 'lib/screens/tasks/task5/images/icon3.jpg',
                        categoryName: 'Skin'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'All List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    catCard(
                      catName: 'Pussy-Cat',
                      catImagePath: 'lib/screens/tasks/task5/images/cat2.jpg',
                      catRating: '5.0',),
                    catCard(
                      catName: "Umair's Cat",
                      catImagePath: 'lib/screens/tasks/task5/images/cat3.jpg',
                      catRating: '4.0',),
                  ],

            )
            )
          ],
        ),
      ),
    );
  }
}
