import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'common/level_title.dart';
import 'common/thin_button.dart';
import 'common/top_nav.dart';
import 'dart:io';

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
      home: LevelSelectionPage(title: "Scales"), //this is just to display for hot reload, home page will be changed,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WarmUpPage(warmUp: 'e_minor_pentatonic', title: 'E Minor Pentatonic', bpm:65))
                          );
                        }
                    ),
                    ThinButton(
                        text: 'A minor pentatonic',
                        onThinButtonPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WarmUpPage(warmUp: 'a_minor_pentatonic', title: 'A Minor Pentatonic', bpm:65))
                          );
                        }
                    ),
                    ThinButton(
                        text: 'D minor pentatonic',
                        onThinButtonPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WarmUpPage(warmUp: 'a_minor_pentatonic', title: 'A Minor Pentatonic', bpm:65))
                          );
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

  static AudioCache _cache = new AudioCache();
  AudioPlayer player;
  String _audioPath;

  @override
  void initState() {
    super.initState();
    _audioPath = widget.warmUp + ".mp3";
    //_load();
  }
/*
  Future<Null> _load() async {
    final ByteData data = await rootBundle.load('assets/audio/' + widget.warmUp + '.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/demo.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    print('finished loading, uri=$mp3Uri');
  }
 */

  void _playSound() async {
    log("In play sound");
    player = await _cache.play("e_minor_pentatonic.mp3");

    setState(() {

    });
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
                          padding: EdgeInsets.all(0),
                          iconSize: 40,
                          icon: Icon(Icons.play_circle_outline),
                          onPressed: _playSound,
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
