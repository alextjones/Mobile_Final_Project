import 'dart:developer';
import 'package:flutter/material.dart';
import 'common/level_title.dart';
import 'common/recorder_view.dart';
import 'common/recording_player.dart';
import 'common/thin_button.dart';
import 'common/top_nav.dart';

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
        disabledColor: Colors.black12,
      ),
      home: WarmUpPage(warmUp: 'e_minor_pentatonic', title: 'E Minor Pentatonic', bpm:65), //this is just to display for hot reload, home page will be changed,
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

  void goToWarmup(String warmupTitle) {
    log("going to " + warmupTitle);
  }

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
                        text: 'E minor pentatonic',
                        onThinButtonPressed: () {
                          log("Pressed level 1 part 1");
                        }
                    ),
                    ThinButton(
                        text: 'A minor pentatonic',
                        onThinButtonPressed: () {
                          log("Pressed level 1 part 1");
                        }
                    ),
                    ThinButton(
                        text: 'D minor pentatonic',
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
                          log("pressed take text");
                        },
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

class WarmUpPage extends StatefulWidget {
  WarmUpPage({Key key, this.warmUp, this.title, this.bpm}) : super(key: key);

  final String warmUp;
  final String title;
  final int bpm;

  @override
  _WarmUpPageState createState() => _WarmUpPageState();
}

class _WarmUpPageState extends State<WarmUpPage> {

  String _recordingPath;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          TopNav(
            includeProfilePicture: false,
            includeBackButton: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: Column(
              children: <Widget> [
                Text(
                  widget.title,
                  style: TextStyle (
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/a_minor_pentatonic.jpg',
                  width: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.play_circle_outline,
                        ),
                        onPressed: () {log ("play button pressed");},
                      ),
                      Text(
                        'Played at ' + widget.bpm.toString() + 'bpm',
                        style: TextStyle(
                          fontSize: 17.92,
                        ),
                      ),
                    ],
                  ),
                ),
                /* As hard as i tried with many different packages each one had issues that rendered it unable to
                perform its function. scrapped.

                SizedBox(height: 40),
                Container(
                  width:300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RecorderView(
                        onSaved: (String filePath) {
                            log("recording complete at " + filePath);
                            setState(() {
                              _recordingPath = filePath;
                            });
                          },
                      ),
                      RecordingPlayer(
                        recordingPath: _recordingPath,
                      ),

                    ],
                  )
                )
                Have tried multiple different packages to record audio each have issues and are not maintained*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
