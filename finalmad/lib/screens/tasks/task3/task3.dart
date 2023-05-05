import '../../../widgets/button_field.dart';
import '../../../widgets/tileText.dart';
import '../../../widgets/message.dart';
import '../../../widgets/radio_button.dart';
import '../../../widgets/input_field.dart';

import 'package:flutter/material.dart';

class TaskThree extends StatefulWidget {
  const TaskThree({super.key});
  final String id = '1';
  final String description = '';
  final String title = '';
  final String status = 'Active';
  final bool insert = true;

  @override
  State<TaskThree> createState() => _TaskThreeState();
}

class _TaskThreeState extends State<TaskThree> {
  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    valueSelected = widget.status;
    if (widget.insert) {
      setState(() {
        screenTitle = 'Add Data';
        addButtonText = 'Add';
      });
    } else {
      setState(() {
        screenTitle = 'Edit Data';
        addButtonText = 'Edit';
      });
    }
  }

  // This is the variable for title, title input field text will store in this variable
  final titleController = TextEditingController();
  // This is the variable for description, description input field text will store in this variable
  final descriptionController = TextEditingController();
  // THis will set screen title
  String screenTitle = '';
  // Variable for add button text
  String addButtonText = '';
  // Variable for radio box
  String valueSelected = '';
  // Variable will true when showMessage box will trigger
  bool showMsg = false;
  // Variable for stroing message text
  String showMessage = '';
  // Variable will true if this page is for insert data and false if this page is for edit data
  bool insertSate = true;
  // This function will set the state of radio box inactive and active
  void setRadioSelected(String setVal) {
    setState(() {
      valueSelected = setVal;
    });
  }

  // This function will call api service for data insertion in api
  changeApi() async {
    try {
      // If any variable will empty then this block of if will execute otherwise else block will execute
      if (titleController.text == '' || descriptionController.text == '') {
        setState(() {
          showMessage = 'All fields should be filled';
          showMsg = true;
        });
      } else {
        setState(() {
          showMessage = 'Successfully saved';
          showMsg = true;
        });
        //   bool saved;
        //   Service data = Service(
        //       id: widget.id.toString(),
        //       title: titleController.text,
        //       description: descriptionController.text,
        //       status: valueSelected);

        //   // This block will execute if data is for insertion and for update else block will execute
        //   if (widget.insert) {
        //     setState(() {
        //       addButtonText = "Adding...";
        //     });
        //     saved = await insertServices(data);
        //   } else {
        //     setState(() {
        //       addButtonText = "Editing...";
        //     });
        //     saved = await editServices(data);
        //   }
        //   if (saved) {
        //     titleController.text = '';
        //     descriptionController.text = '';
        //     setState(() {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const HomePage()),
        //       );
        //     });
        //   }
      }
    } catch (e) {
      setState(() {
        showMessage =
        'Data not inserred at this time after some time try again';
        showMsg = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            // These two show message block will trigger when showMsg will true
            (showMsg)
                ? MyMessage(message: showMessage, success: true)
                : const SizedBox(height: 0),
            (showMsg) ? const SizedBox(height: 50) : const SizedBox(height: 0),

            Center(
              child: Text(screenTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),),
            ),
            const SizedBox(height: 50),
            InputField(controller: titleController, labelHint: 'Title'),
            const SizedBox(height: 20),
            InputField(
                controller: descriptionController, labelHint: 'Description'),
            const SizedBox(height: 20),
            MyRadioButton(
                radioValue: "Active",
                radioTitle: "Active",
                radioGroupValue: valueSelected,
                radioHandler: setRadioSelected),
            MyRadioButton(
                radioValue: "InActive",
                radioTitle: "InActive",
                radioGroupValue: valueSelected,
                radioHandler: setRadioSelected),
            button_field(buttontext: addButtonText, OnTap: changeApi),
          ],
        ),
      ),
    );
  }
}
