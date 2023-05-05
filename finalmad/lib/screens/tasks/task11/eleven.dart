import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './show_data.dart';

class TaskEleven extends StatefulWidget {
  const TaskEleven({super.key});

  @override
  State<TaskEleven> createState() => _TaskElevenState();
}

class _TaskElevenState extends State<TaskEleven> {
  int recentScreen = 0;
  final List<Widget> screens = [
    const ShowData(),
    const ShowData(),
    const ShowData(),
    const ShowData(),
  ];

  openScreen(int id) {
    setState(() {
      recentScreen = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[recentScreen],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            onTabChange: (index) {
              setState(() {
                recentScreen = index;
              });
            },
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.insert_chart_outlined_outlined,
                text: "Insert",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(icon: Icons.settings, text: "Setting"),
            ],
          ),
        ),
      ),
    );
  }
}
