// ignore_for_file: file_names

import 'package:assign4_crud_firebase/auth_controller.dart';
import 'package:assign4_crud_firebase/drawer_header.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'Edit-record.dart';
import 'InsertRecord.dart';
import 'bottom_navigator.dart';

String stringRep = "";
List mapRep = [];

// enum MenuActions { Accounts, Forget }

class APIView extends StatefulWidget {
  final String email;
  APIView({Key? key,required this.email}) : super(key: key);

  @override
  State<APIView> createState() => _APIViewState();
}
final ref = FirebaseDatabase.instance.ref().child('Productss');

class _APIViewState extends State<APIView> {

  Future apiCall() async {
    // http.Response response = await http
    //     .get(Uri.parse("https://pcc.edu.pk/ws/bscs2020/services.php"));
    // if (response.statusCode == 200) {
    //   setState(() {
    //     mapRep = json.decode(response.body);
    //   });
    // }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }


  Widget listItem({required Map Products}){
    String ke = Products['key'];
    return Slidable(
      key: ValueKey(ke),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: (){
        },),
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context){},
            backgroundColor: Colors.redAccent,
            icon: Icons.delete,
            label: 'DELETE',
          ),

        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(onPressed: (context){
            //Navigator.pop(context);
            print(ke);
            Get.to(()=>EditRecord(Productkey: ke));
            //Get.off(()=>EditRecord(Productkey: ke));
          },
            backgroundColor: Colors.blue,
            icon: Icons.edit_attributes,
            label: 'EDIT',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, top: 5.0),
        margin: const EdgeInsets.only(top: 7.0,left: 5,right: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              // wrap below Text widget with textrich widget to make it bold
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Title: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: Products["title"],
                      style: const TextStyle(color: Colors.black))
                ]),
              ),
            ]),
            SizedBox(height: 8),
            Row(children: [
              // wrap below Text widget with textrich widget to make it bold
              Expanded(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Description: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: Products["description"],
                        style: const TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        )
                    )
                  ]),
                ),
              ),
            ]),
            SizedBox(height: 8),
            Row(children: [
              // wrap below Text widget with textrich widget to make it bold
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Status: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: Products["status"],
                      style: const TextStyle(color: Colors.black))
                ]),
              ),
            ]),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Calls Result"),
      backgroundColor: Colors.red[300],
        centerTitle: true,
      ),
      // drawer: Drawer(
      //   child: SingleChildScrollView(
      //     child: Column(
      //         children: [
      //           drawerHeader(em: widget.email),
      //           drawerList(),
      //         ]
      //     ),
      //   ),
      // ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,
          Animation<double>animation,int index){
            Map Productss = snapshot.value as Map;
            Productss['key'] = snapshot.key;
            return listItem(Products: Productss);
          }
        )
      ),
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
            AuthController.instance.logout();
            Navigator.pushNamed(context, 'signin');
          }
          if(index==2){
            Get.offAll(()=>drawerHeader(em: widget.email));
          }
          else if (index==1){
            Get.offAll(()=>APIView(email: widget.email));
          }
          else if (index==3){
            Get.offAll(()=>InsertRecord(email: widget.email));

          }
        },
        tabs: const[
          GButton(icon: Icons.home,
              text: 'Sigin In'),
          GButton(icon: Icons.favorite_border,
              text: 'Favourite'),
          GButton(icon: Icons.account_circle,
              text: 'Profile'),
          GButton(icon: Icons.add_circle_outline,
              text: 'Add',)


        ],
      ),
    );
  }
}

      
