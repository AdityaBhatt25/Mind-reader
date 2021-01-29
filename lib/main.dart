import 'package:flutter/material.dart';
import 'decoding_text_effect.dart';
import "dart:math";
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:io';

var list = ['❤', '✌', '😂', '😐', '💀', '🔥', '❄', '🤩', '😎', '🎃'];
List<dynamic> notes = new List();

final _random2 = new Random();
var element2 = list[_random2.nextInt(list.length)];
var x = element2;

void main() {
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  List<dynamic> myText = [
    '\n\n\nMind\nReader',
    '\nChoose any two digit number, add together both digits and subtract it from your orignal number.',
    'When you have the final number click next and look it up on the chart and find the relevent symbol. Concentrate on the symbol and when you have it clearly in your mind click next it will show you the symbol you are thinking of...',
  ];

  void changeText() {
    setState(() {
      index++;
      if (index == myText.length) {
        index = 0;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      }
      for (int i = 0; i < 100; i++) {
        if ((i + 1) % 9 == 0) {
          notes.add('${i + 1}.) $x');
        } else {
          final _random = new Random();
          var element = list[_random.nextInt(list.length)];

          notes.add('${i + 1}.) $element');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: DecodingTextEffect(
                  myText[index],
                  decodeEffect: DecodeEffect.fromStart,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 30, color: Color(0xff00ff41)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff00ff41),
        child: Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
        onPressed: changeText,
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Table"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.all(16.0),
          child: HomePage(notes),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          backgroundColor: Colors.lightBlue,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute2()),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  final List<dynamic> notes;

  HomePage(this.notes);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notes.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(
                widget.notes[pos],
                style: TextStyle(
                  fontSize: 25.0,
                  height: 1.6,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SecondRoute2 extends StatelessWidget {
@override
Widget build(BuildContext context) {
  
  return new WillPopScope(
    onWillPop: () async => false,
    child: new Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlue,
          title: Text("The Symbol in your mind is"),
        ),
        
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(16.0),
          child: Text(
            '\n\n$x',
            style: TextStyle(fontSize: 70, color: Color(0xff00ff41)),
            textAlign: TextAlign.center,
          ),
        ),
        
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.close),
          backgroundColor: Colors.red,
          onPressed: () => exit(0),
        )),
  );
}}