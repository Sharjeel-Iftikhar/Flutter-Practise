import 'package:finalmad/screens/tasks/task6/task6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen.dart';

class homeSix extends StatelessWidget {
  const homeSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future <void> turningFalse()async{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      try {
        pref.setBool( taskSixState.KEY_SignIn , false);
      } on Exception catch (e, s) {
        print(s);
      }
    }

    return Scaffold(
      body: Center(child: Text("SixHome")),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.red.shade300,
        color: Colors.white,
        activeColor: Colors.white,
        selectedIndex: 1,
        tabBackgroundColor: Colors.redAccent.shade100,
        padding: EdgeInsets.all(16),
        gap: 6,
        onTabChange: (index){
          if(index==0){
            // AuthController.instance.logout();
            // Navigator.pushNamed(context, 'signin');
            Get.off(()=>home_screen());

          }
          if(index==2){

          }
          else if (index==1){
            turningFalse();
            Get.off(()=>home_screen());

          }
          else if (index==3){


          }

        },
        tabs: const[
          GButton(icon: Icons.home,
              text: 'Home'),
          GButton(icon: Icons.favorite_border,
              text: 'LogOut'),
          GButton(icon: Icons.account_circle,
              text: 'Profile'),
          GButton(icon: Icons.add_circle_outline,
            text: 'Add',),


        ],
      ),
    );
  }
}
