import 'package:finalmad/screens/tasks/task2/expansion_panel.dart';
import 'package:finalmad/screens/tasks/task2/expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'carusel_slider.dart';

class Task_two extends StatefulWidget {
  const Task_two({Key? key}) : super(key: key);

  @override
  State<Task_two> createState() => _Task_twoState();
}

class _Task_twoState extends State<Task_two> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Task 2")),
          backgroundColor:Color.fromARGB(255, 187, 212, 255),
          bottom: const TabBar(
                isScrollable: true,
              indicatorPadding: EdgeInsets.all(8),
              tabs: [
                Tab(
                  child: Text("Expansion Panel "),
                ),
                Tab(
                  child: Text("Expansion Tile "),
                ),
                Tab(
                  child: Text("Carousel Slider "),
                ),
              ]
          ),
        ),
        body: const TabBarView(children: [
          expansion_panel(),
          MyExpansionTile(),
          caruselSlider(),
        ]),
      ),
    );
  }
}
