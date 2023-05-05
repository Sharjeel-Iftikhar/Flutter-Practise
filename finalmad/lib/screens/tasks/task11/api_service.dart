import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './api_urls.dart';
import './model.dart';

Future<List<Todo>> fetchServices() async {
  final response = await http.get(Uri.parse(ApiConstants.baseUrl));
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    // final body = res['todos'];
    // print(body);
    return body["todos"].map<Todo>((todo) => Todo.fromJson(todo)).toList();
    // return body.map<Todo>(Todo.fromJson).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
