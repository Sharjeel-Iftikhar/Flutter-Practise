import 'package:flutter/material.dart';
import 'Quotes.dart';

void main() {
  runApp(const MaterialApp(
    home: SpideyCard(),
  ));
}

class SpideyCard extends StatefulWidget {
  const SpideyCard({super.key});

  @override
  State<SpideyCard> createState() => _SpideyCardState();
}

class _SpideyCardState extends State<SpideyCard> {
  List<Quotes> quotes = [
    Quotes(text: 'Never Lose Hope', author: 'Sheri'),
    Quotes(text: 'Worries Stops where Faith begins', author: 'Sheri'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      appBar: AppBar(
        title: const Text(
          'Spidey Card',
          style: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 20.0,
            wordSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/abc.jpeg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Color.fromARGB(255, 32, 32, 32),
              ),
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontFamily: 'Caveat',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Sharjeel-Iftikhar',
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 29, 24),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caveat',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Spider\'s Tinkle Level',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontFamily: 'Caveat',
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '08',
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 29, 24),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caveat',
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                    size: 18.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'isharjeelIftikhar@gmail.com',
                    style: TextStyle(
                        color: Color.fromARGB(255, 102, 29, 24),
                        letterSpacing: 1.0,
                        fontSize: 20.0,
                        fontFamily: 'Caveat'),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: quotes
                      .map((Quot) => Text('${Quot.text} - ${Quot.author}'))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
