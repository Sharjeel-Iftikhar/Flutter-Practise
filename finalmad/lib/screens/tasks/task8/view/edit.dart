
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/product_controller.dart';
import '../model/product.dart';
import 'view_all.dart';

class edit extends StatefulWidget {
  edit({Key? key}) : super(key: key);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  final _productController = Get.put(productController());

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void getData(){

    titleController.text = _productController.oneProduct[0].title.toString();
    descriptionController.text = _productController.oneProduct[0].description.toString();
  }

  @override
  void initState(){

    super.initState();
    getData();
  }

   Widget ShowUpdateDialog(
       BuildContext context,
       ) {
     return Scaffold(
       appBar: AppBar(title: const Text("Edit Record"),
         backgroundColor: Colors.red[300],
         centerTitle: true,
       ),
       body: Center(
         child: Column(
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
                     ),
                   ),
                 ),
                 const SizedBox(
                   height: 30,
                 ),
                 const SizedBox(
                   height: 30,
                 ),
                 MaterialButton(
                   onPressed: () {
                     _updateDb();
                     Get.to(()=>view_all());
                   },
                   color: Colors.red[300],
                   textColor: Colors.white,
                   minWidth: 300,
                   height: 40,
                   child: const Text('Update Data'),
                 ),
               ],
             ),
           ],
         ),
       ),

     );
   }

  @override
  Widget build(BuildContext context) {
    return ShowUpdateDialog(context);

  }
  _updateDb()async{

    int? i = _productController.oneProduct[0].id;
    // print('helllllooooooo'+i.toString());
    await _productController.updateProduct(i!,
        Product(title : titleController.text,
      description : descriptionController.text)
    );
    _productController.viewAl();
  }
}
