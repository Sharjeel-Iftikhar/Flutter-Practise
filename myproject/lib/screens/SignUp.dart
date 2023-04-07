import 'package:flutter/material.dart';
import 'package:myproject/screens/SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigt = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 13),
              Container(
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/signup.jpg"),
                      fit: BoxFit.fitHeight),
                ),
              ),
              // Email TextField
              SizedBox(height: 9),
              Container(
                width: width * 0.75,
                height: heigt * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        spreadRadius: 6,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0.9,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
              SizedBox(height: 14),
              Container(
                width: width * 0.75,
                height: heigt * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        spreadRadius: 6,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ]),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0.9,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
              SizedBox(height: 19),
              Container(
                width: width * 0.75,
                height: heigt * 0.07,
                decoration: BoxDecoration(
                  color: Theme.of(context).iconTheme.color,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                )),
              ),
              SizedBox(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Already have account?",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(" Login",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 12,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600)),
                )
              ]),
              SizedBox(height: 20),
              Container(
                width: width*0.67,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Text("OR")),
                    SizedBox(width: 6),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.1,
                          color: Colors.black,
                        ),
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/icons/google.png",
                      height: 18,),
                    ),
                    SizedBox(width: 25),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.1,
                            color: Colors.black,
                          ),
                          shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/icons/twitter.png",
                        height: 18,),
                    ),
                    SizedBox(width: 25),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.1,
                            color: Colors.black,
                          ),
                          shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/icons/facebook.png",
                        height: 18,),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
