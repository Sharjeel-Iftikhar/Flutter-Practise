import 'package:flutter/material.dart';
import 'package:myproject/screens/SignUp.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                child: Text("Login",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.jpg"),
                    fit: BoxFit.fitHeight
                  ),
                ),
              ),
              // Email TextField
              SizedBox(height: 9),
              Container(
                width: width*0.75,
                height: heigt*0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(
                    blurRadius: 10,
                    offset: Offset(1,1),
                    spreadRadius: 6,
                    color: Colors.grey.withOpacity(0.2),
                  )]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_rounded,
                      color: Theme.of(context).iconTheme.color,),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.9,
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
              SizedBox(height: 14),
              Container(
                width: width*0.75,
                height: heigt*0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(
                      blurRadius: 10,
                      offset: Offset(1,1),
                      spreadRadius: 6,
                      color: Colors.grey.withOpacity(0.2),
                    )]
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password_outlined,
                        color: Theme.of(context).iconTheme.color,),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0.9,
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
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot your Password?',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 12,
                        letterSpacing: 0.3
                      )
                      )
                  ],
                ),
              ),
              SizedBox(height: 11),
              Container(
                width: width*0.75,
                height: heigt*0.06,
                decoration: BoxDecoration(
                  color: Theme.of(context).iconTheme.color,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(child:
                Text("Login",
                style: Theme.of(context).textTheme.labelLarge!
                    .copyWith(color: Colors.white),
                )
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(" Sign Up",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 12,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600)
                    ),
                  )

                ]
              )

            ],
          ),
        ),
      ),
    );
  }
}
