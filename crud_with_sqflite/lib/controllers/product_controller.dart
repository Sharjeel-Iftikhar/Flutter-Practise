import 'package:crud_with_sqflite/db/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../model/product.dart';
class productController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    oneProduct = <Product>[];
  }

  // Insert
  Future<int> insertProduct(Product? pro) async {
    return await sql_helper.Additems(pro);
  }
// View
  var ProductList = <Product>[].obs;

  void viewAl() async {
    List<Map<String, dynamic>> products = await sql_helper.query();
    ProductList.assignAll(products.map((data) => new Product.fromJson(data)).toList());
    print("here the size is" + "${ProductList.length}");
  }

  // Delete
  void Delete(int id){
      sql_helper.deleteItem(id);
  }

  // update

  var oneProduct = <Product>[];
  Future<void> getone(int id) async {
    oneProduct = <Product>[];
    List<Map<String, dynamic>> pro = await sql_helper.viewOne(id);
    oneProduct.assignAll(pro.map((data) => new Product.fromJson(data)).toList());
  }
  Future<void> updateProduct(int id,Product? pro) async {
    await sql_helper.update(id, pro!);
  }

}