
import 'package:finalmad/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/product_controller.dart';
import 'edit.dart';
import 'insert.dart';
class view_all extends StatefulWidget {
  const view_all({Key? key}) : super(key: key);

  @override
  State<view_all> createState() => _view_allState();
}

class _view_allState extends State<view_all> {
  final _productController = Get.put(productController());
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();


  @override
  void initState(){
    _productController.viewAl();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Viewing All Products"),
        backgroundColor: Colors.red[300],
        centerTitle: true,
      ),
      body: Column(
        children: [
          _showAllProducts(),
        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.red.shade300,
        color: Colors.white,
        activeColor: Colors.white,
        selectedIndex: 0,
        tabBackgroundColor: Colors.redAccent.shade100,
        padding: EdgeInsets.all(16),
        gap: 6,
        onTabChange: (index){
          if(index==0){
            Get.off(home_screen());
          }
          if(index==2){
            Get.to(()=>insert());
          }
          else if (index==1){
            _productController.viewAl();
          }
        },
        tabs: const[
          GButton(icon: Icons.home,
              text: 'Home'),
          GButton(icon: Icons.favorite_border,
              text: 'Favourite'),
          GButton(icon: Icons.add_circle_outline,
            text: 'Add',)


        ],
      ),
    );
  }
  _showAllProducts(){
      return Expanded(
        child: Obx((){
          return ListView.builder(
              itemCount: _productController.ProductList.length,
              itemBuilder: (_,index){
               // print(_productController.ProductList.length);
                int? ke = _productController.ProductList[index].id;
                //print(ke);
                return Slidable(
                  key: ValueKey(ke),
                  startActionPane: ActionPane(
                    dismissible: DismissiblePane(onDismissed: (){
                      _productController.Delete(ke!);
                      _productController.viewAl();
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
                      SlidableAction(onPressed: (context)async{
                        await _productController.getone(ke!);
                        Get.to(()=>edit());

                      },
                        backgroundColor: Colors.blue,
                        icon: Icons.edit_attributes,
                        label: 'EDIT',
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    margin: const EdgeInsets.only(top: 15.0,left: 5,right: 5),
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
                                  text: _productController.ProductList[index].title.toString(),
                                  style: const TextStyle(color: Colors.black))
                            ]),
                          ),
                        ]),
                        SizedBox(height: 15),
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
                                    text: _productController.ProductList[index].description.toString(),
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

                      ],
                    ),
                  ),
                );
          });
        }),
      );
  }
}
