// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as devtools show log;

String stringRep = "";
List mapRep = [];

// enum MenuActions { Accounts, Forget }

class APIView extends StatefulWidget {
  const APIView({super.key});

  @override
  State<APIView> createState() => _APIViewState();
}

class _APIViewState extends State<APIView> {
  Future apiCall() async {
    http.Response response = await http
        .get(Uri.parse("https://pcc.edu.pk/ws/bscs2020/services.php"));
    if (response.statusCode == 200) {
      setState(() {
        // stringRep = response.body;

        mapRep = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Calls Result"), ),
      body: Container(
        child: mapRep == null
            ? const Text("Data is loading")
            : ListView.builder(
                itemCount: mapRep.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
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
                                  text: mapRep[index]["title"],
                                  style: const TextStyle(color: Colors.black))
                            ]),
                          ),
                        ]),
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
                                    text: mapRep[index]["description"],
                                    style: const TextStyle(color: Colors.black))
                              ]),
                            ),
                          ),
                        ]),
                        Row(children: [
                          // wrap below Text widget with textrich widget to make it bold
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Status: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: mapRep[index]["status"],
                                  style: const TextStyle(color: Colors.black))
                            ]),
                          ),
                        ]),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

      
