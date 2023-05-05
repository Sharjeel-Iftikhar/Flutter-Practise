// ignore_for_file: file_names
import 'package:finalmad/screens/home_screen.dart';
import 'package:finalmad/screens/tasks/task4/auth_controller.dart';
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
import 'drawer_header.dart';
// import 'bottom_navigator.dart';


String stringRep = "";
List mapRep = [];

// enum MenuActions { Accounts, Forget }

class APIView extends StatefulWidget {
  final String email;
  APIView({Key? key,required this.email}) : super(key: key);

  @override
  State<APIView> createState() => _APIViewState();
}
final ref = FirebaseDatabase.instance.ref().child('Student');

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


  Widget listItem({required Map Students}){
    String ke = Students['key'];
    return Slidable(
      key: ValueKey(ke),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: (){
          ref.child(Students['key']).remove();
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
                      text: "Name: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: Students["Name"],
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
                        text: "Email: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: Students["Email"],
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
                      text: "Contact No: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: Students["Contact No"],
                      style: const TextStyle(color: Colors.black))
                ]),
              ),
            ]),
            SizedBox(height: 12),
            Row(children: [
              // wrap below Text widget with textrich widget to make it bold
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Gender: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: Students["Gender"],
                      style: const TextStyle(color: Colors.black))
                ]),
              ),
            ]),
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
            Map Students = snapshot.value as Map;
            Students['key'] = snapshot.key;
            return listItem(Students: Students);
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
            // AuthController.instance.logout();
            // Navigator.pushNamed(context, 'signin');
            Get.off(()=>home_screen());

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
              text: 'Home'),
          GButton(icon: Icons.favorite_border,
              text: 'View ALl'),
          GButton(icon: Icons.account_circle,
              text: 'Profile'),
          GButton(icon: Icons.add_circle_outline,
              text: 'Add',),


        ],
      ),
    );
  }

}

      
