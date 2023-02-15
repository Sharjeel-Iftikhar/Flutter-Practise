// ignore_for_file: file_names

import 'package:assign4_crud_firebase/auth_controller.dart';
import 'package:assign4_crud_firebase/drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as devtools show log;

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

class _APIViewState extends State<APIView> {

  Future apiCall() async {
    http.Response response = await http
        .get(Uri.parse("https://pcc.edu.pk/ws/bscs2020/services.php"));
    if (response.statusCode == 200) {
      setState(() {
        // stringRep = response.body;

        mapRep = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
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
        child: mapRep == null
            ? const Text("Data is loading")
            : ListView.builder(
                itemCount: mapRep.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
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
                        SlidableAction(onPressed: (context){},
                          backgroundColor: Colors.blue,
                          icon: Icons.edit_attributes,
                          label: 'EDIT',
                        ),
                        SlidableAction(onPressed: (context){},
                          backgroundColor: Colors.green,
                          icon: Icons.add_circle_outlined,
                          label: 'ADD',
                        )
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
                                    text: mapRep[index]["title"],
                                    style: const TextStyle(color: Colors.black))
                              ]),
                            ),
                          ]),
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
                                      text: mapRep[index]["description"],
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
                                    text: mapRep[index]["status"],
                                    style: const TextStyle(color: Colors.black))
                              ]),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  );
                },
              ),

      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.red.shade300,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.redAccent.shade100,
        padding: EdgeInsets.all(16),
        gap: 8,
        tabs: const[
          GButton(icon: Icons.home,
              text: 'Sigin In'),
          GButton(icon: Icons.favorite_border,
              text: 'Favourite'),
          GButton(icon: Icons.account_circle,
              text: 'Profile'),

        ],
      ),
    );
  }
  // Widget drawerList(){
  //   return Container(
  //     padding: EdgeInsets.only(top:15),
  //     child: Column(
  //       children: [
  //         Card(
  //           child: GestureDetector(
  //             onTap: (){
  //               AuthController.instance.logout();
  //             },
  //             child: ListTile(
  //               leading: Icon(Icons.arrow_circle_left_sharp),
  //               contentPadding: EdgeInsets.only(left: 30),
  //               title:Text('Log out'),
  //
  //
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

      
