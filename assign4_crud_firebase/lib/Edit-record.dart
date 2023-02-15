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

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    //Get.back();
    dbRef = FirebaseDatabase.instance.ref().child('Productss');
    getProductData();
  }

  void getProductData() async {
    DataSnapshot snapshot = await dbRef.child(widget.Productkey).get();
    Map student = snapshot.value as Map;
    //String a = '${widget.studentKey}/title';
    print(student['title']);
    print("asdasda");
    titleController.text = student['title'];
    descriptionController.text = student['description'];
    statusController.text = student['status'];
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
                  labelText: 'Title',
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
                  labelText: 'Description',
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
                  labelText: 'Status',
                  //hintText: 'Enter Your Salary',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: MaterialButton(
                onPressed: () {
                  Map<String, String> products = {
                    'title': titleController.text,
                    'description': descriptionController.text,
                    'status': statusController.text
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
