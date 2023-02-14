import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class fargotScreen extends StatefulWidget {
  const fargotScreen({super.key});

  @override
  State<fargotScreen> createState() => _fargotScreenState();
}

class _fargotScreenState extends State<fargotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0,top: 60.0,right: 40.0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(onPressed: (){},
                      icon: Icon(Icons.lock,
                          color: Colors.orange[300],
                          size: 24.0),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey[900],
                            wordSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.close,
                      size: 24.0,
                      color: Colors.grey[600],
                    ),
                  ]
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text('Enter your Email that you used to register '
                    'your account,so we can send you link to '
                    'reset your password',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                    wordSpacing: 1
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email *',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left:30.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  )
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.only(top:12.0,bottom: 12.0),
                      child: Text('Send link',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      ),
                      ),
                    )
                ),
              ),
              SizedBox(height: 25.0,),
              Divider(
                height: 10.0,
                color: Colors.black12,
                thickness: 1.3,
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot your email?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                    Text('Try phone number',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, 'accountpage');
                  },
                      child: Text('Accounts Page',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, 'apiview');
                  },
                      child: Text('Api View Page',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
