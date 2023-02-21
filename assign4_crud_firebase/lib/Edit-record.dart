import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditRecord extends StatefulWidget {
  final String Productkey;
  EditRecord({Key? key,required this.Productkey}) : super(key: key);

  @override
  State<EditRecord> createState() => _EditRecordState();
}

class _EditRecordState extends State<EditRecord> {
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
    //Get.back();
    dbRef = FirebaseDatabase.instance.ref().child('Student');
    getProductData();
  }

  void getProductData() async {
    DataSnapshot snapshot = await dbRef.child(widget.Productkey).get();
    Map student = snapshot.value as Map;
    //String a = '${widget.studentKey}/title';
    print(student['Name']);
    print("asdasda");
    titleController.text = student['Name'];
    descriptionController.text = student['Email'];
    statusController.text = student['Contact No'];
    genderController.text = student['Gender'];
  }

  Widget ShowUpdateDialog(
      BuildContext context,
      ) {
    return SimpleDialog(
      title: const Center(
        child: Text('Updating record'),
      ),
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  //hintText: 'Enter Your Age',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: statusController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contact No',
                  //hintText: 'Enter Your Salary',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                value: genderController.text.isNotEmpty
                    ? genderController.text
                    : null,
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: MaterialButton(
                onPressed: () {
                  Map<String, String> products = {
                    'Name': titleController.text,
                    'Email': descriptionController.text,
                    'Contact No': statusController.text,
                    'Gender' : genderController.text
                  };

                  dbRef
                      .child(widget.Productkey)
                      .update(products)
                      .then((value) => {Navigator.pop(context)});
                },
                color: Colors.red[300],
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
                child: const Text('Update Data'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpdateDialog(context);
  }
}
