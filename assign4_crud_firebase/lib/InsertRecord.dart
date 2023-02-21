import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'APIView.dart';
import 'auth_controller.dart';
import 'drawer_header.dart';

class InsertRecord extends StatefulWidget {
  final String email;
  const InsertRecord({Key? key,required this.email}) : super(key: key);



  @override
  State<InsertRecord> createState() => _InsertRecordState();
}

class _InsertRecordState extends State<InsertRecord> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final statusController = TextEditingController();
  final genderController = TextEditingController();
  String _selectedGender = "";
  final List<String> _genderOptions = ['Male', 'Female', 'Not-known', 'Other'];

  late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Student');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text('Inserting data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Inserting data in Firebase Realtime Database',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Name',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: statusController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact No',
                    hintText: 'Enter contactNo',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedGender.isNotEmpty ? _selectedGender : null,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                      genderController.text = value;
                    });
                  },
                  items: _genderOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> products = {
                      'Name': titleController.text,
                      'Email': descriptionController.text,
                      'Contact No': statusController.text,
                      'Gender': genderController.text
                    };

                    dbRef.push().set(products);
                    Get.offAll(()=>APIView(email: widget.email));
                  },
                  color: Colors.red[300],
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                  child: const Text('Insert Data'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.red.shade300,
        color: Colors.white,
        activeColor: Colors.white,
        selectedIndex: 3,
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
            Get.offAll(()=>InsertRecord(email: widget.email,));
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
