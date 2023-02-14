import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class accountscreen extends StatefulWidget {
  const accountscreen({Key? key}) : super(key: key);

  @override
  State<accountscreen> createState() => _accountscreenState();
}

class _accountscreenState extends State<accountscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 35.0,top: 60.0,right: 40.0),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(onPressed: (){},
                    icon: Icon(Icons.manage_accounts_rounded,
                        color: Colors.orange[300],
                        size: 24.0),
                    label: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Accounts',
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
              child: Text('Add another account -so you'
                  ' can switch between them easily',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[500],
                    wordSpacing: 1
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Your existing account',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Manage account',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,top:5,bottom:8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffE6E6E6),
                            child: Icon(
                              Icons.person,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                          title: Text('Panji Pradana'),
                          subtitle: Text('Panjiperdana@mail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          ),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,top:5,bottom:8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffE6E6E6),
                            child: Icon(
                              Icons.person,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                          title: Text('Sulistyo Aji'),
                          subtitle: Text('SlstAji@mail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                            trailing: Padding(

                              padding: EdgeInsets.only(right: 7.0),
                              child: Text('5',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,top:5,bottom:8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffE6E6E6),
                            child: Icon(
                              Icons.person,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                          title: Text('Astaru Lopez'),
                          subtitle: Text('AsPez@mail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text('10',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(top:12.0,bottom: 12.0),
                    child: Text('Add Account +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  )
              ),
            ),
            // SizedBox(height: 25.0,),
            // SizedBox(height: 20),
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      top:MediaQuery.of(context).size.height* 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(onPressed: (){
                      Navigator.pushNamed(context, 'fargot');
                    },
                        child: Text('Forgot Page',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
