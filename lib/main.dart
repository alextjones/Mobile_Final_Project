import 'dart:developer';
import 'package:flutter/material.dart';
import 'common/thin_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fretless',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LevelSelectionPage(title: 'Scales'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LevelSelectionPage extends StatefulWidget {
  LevelSelectionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LevelSelectionPageState createState() => _LevelSelectionPageState();
}

class _LevelSelectionPageState extends State<LevelSelectionPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/person_placeholder.png'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
