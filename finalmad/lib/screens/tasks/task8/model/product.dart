import 'package:flutter/material.dart';
class Product{
  int? id;
  String? title;
  String? description;

  Product({
    this.id,
    this.title,
    this.description
});

  Product.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data =  new Map<String,dynamic>();
    data['id']=this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
