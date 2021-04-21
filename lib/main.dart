import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'common/level_title.dart';
import 'common/thin_button.dart';
import 'common/top_nav.dart';

void main() {
  runApp(MyApp());
}

//Test Alex's Branch LevelSelectionPage(title: 'Scales')
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
      home: MainSelectionPage(), //this is just to display for hot reload, home page will be changed,
      debugShowCheckedModeBanner: false,
    );
  }
}

class LevelSelectionPage extends StatefulWidget {
  LevelSelectionPage({Key key, this.title, this.unlockedLevels}) : super(key: key);

  final String title;
  final List<bool> unlockedLevels;

  @override
  _LevelSelectionPageState createState() => _LevelSelectionPageState();
}

class _LevelSelectionPageState extends State<LevelSelectionPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          TopNav(
            includeBackButton: true,
            includeProfilePicture: true,
          ),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
            shrinkWrap: true,
            children: <Widget>
            [
              Text(
                widget.title,
                style: TextStyle (
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              LevelTitle(
                title: 'Level 1',
                isUnlocked: true,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: <Widget>[
                    ThinButton(
                        text: 'E flat major',
                        onThinButtonPressed: () {
                          log("Pressed level 1 part 1");

                        }
                    ),
                    ThinButton(
                        text: 'B flat major',
                        onThinButtonPressed: () {
                          log("Pressed level 1 part 1");
                        }
                    ),
                    ThinButton(
                        text: 'C major',
                        onThinButtonPressed: () {
                          log("Pressed level 1 part 1");
                        }
                    ),
                  ],
                ),
              ),
              LevelTitle(
                title: 'Level 2',
                isUnlocked: false,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: <Widget>[
                    ThinButton(
                        text: 'Take the test to unlock',
                        onThinButtonPressed: () {
                          log("Pressed level 1 part 1");
                        }
                    ),
                  ],
                ),
              ),
              LevelTitle(
                title: 'Level 3',
                isUnlocked: false,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Unlock the previous level to reveal this level\'s test.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class MainSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopNav(
            includeBackButton: false,
            includeProfilePicture: true,
          ),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
            shrinkWrap: true,
            children: <Widget>
            [

              Text(
                "Welcome to Fretless!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: <Widget>[
                    ThinButton(
                        text: 'Warm Up',
                        onThinButtonPressed: () {
                          log("Pressed Warm up button (MainPage)");
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ActivitySelectionPage()),
                          );
                        }
                    ),
                    ThinButton(
                        text: 'Tunes',
                        onThinButtonPressed: () {
                          log("Pressed Tune button (MainPage)");
                        }
                    ),
                    ThinButton(
                        text: 'Metronome',
                        onThinButtonPressed: () {
                          log("Pressed Metronome button (MainPage)");
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActivitySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopNav(
            includeBackButton: true,
            includeProfilePicture: true,
          ),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
            shrinkWrap: true,
            children: <Widget>
            [

              Text(
                "Warm Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: <Widget>[
                    ThinButton(
                        text: 'Scales',
                        onThinButtonPressed: () {
                          log("Pressed Scales button (SelectPage)");
                        }
                    ),
                    ThinButton(
                        text: 'Chords',
                        onThinButtonPressed: () {
                          log("Pressed Chord button (SelectPage)");
                        }
                    ),
                    ThinButton(
                        text: 'Left Handed Mode',
                        onThinButtonPressed: () {
                          log("Pressed left hand mode (selectPage");
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

