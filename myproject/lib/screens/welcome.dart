import 'package:flutter/material.dart';

import 'SignIn.dart';

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset("assets/images/welcome_image.png"),
            SizedBox(height: 30),
            Text("Welcome to Connectify \n secure messaging app",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith
              (fontWeight: FontWeight.bold,
            fontSize: 18),
            ),
            SizedBox(height: 23),
            Text("Happiness all depends upon you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[800]!.withOpacity(0.64),
            ),
            ),
            SizedBox(height: 26),
            FittedBox(
              child: TextButton(
                onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn())),
                child: Row(
                  children: [
                    Text("Skip",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[900]!.withOpacity(0.8),
                      letterSpacing: 1.1
                    ),
                    ),
                    SizedBox(width: 3),
                    Icon(Icons.arrow_forward_ios,
                    size: 13,
                    color:Colors.grey[900]!.withOpacity(0.8),)
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
