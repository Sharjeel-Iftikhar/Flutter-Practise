import 'package:finalmad/screens/tasks/task4/register.dart';

import 'auth_controller.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: hei*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/loginimg.png'
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.only(left: 27,right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello Ameigos',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 8,),
                  Text('Sign into your account',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[ BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1,1),
                        color: Colors.grey.withOpacity(0.2),
                      )]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email,color: Colors.deepOrange,),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0
                          )
                        ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                              )
                          ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 14,),
                  Container(
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:[ BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        )]
                    ),
                    child: TextField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                          prefixIcon: Icon(Icons.password_outlined,color: Colors.deepOrangeAccent,),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot your Password?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: width*0.43,
              height: hei*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                        'images/loginbtn.png'
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: GestureDetector(
                onTap: (){
                  AuthController.instance.login(emailController.text.trim(), passController.text.trim());
                },
                child: Center(
                  child: Text('Sign In',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
            ),
            SizedBox(height: hei*0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 17,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w400,
                ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context )=> register()));
                  },
                  child: Text(' Create',style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 17,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,)
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
