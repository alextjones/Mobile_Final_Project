import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RecordingPlayer extends StatefulWidget {

  final String recordingPath;

  const RecordingPlayer({
    Key key,
    this.recordingPath,
  }) : super (key: key);

  @override
  _RecordingPlayerState createState() => _RecordingPlayerState();
}

class _RecordingPlayerState extends State<RecordingPlayer> {

  int _totalDuration;
  int _currentDuration;
  double _completedPercentage = 0.0;
  bool _isPlaying = false;
  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Container(
            width: 90,
            child: IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 40,
              ),
              onPressed: () => _onPlay(widget.recordingPath),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              value: _completedPercentage,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPlay (String filePath) async {
    AudioPlayer audioPlayer = AudioPlayer();

    log("path: ++++ " + filePath);

    if (!_isPlaying) {
      if (_isPaused) {
        audioPlayer.resume();
      } else {
        audioPlayer.play(filePath, isLocal: true);
      }
      setState(() {
        _completedPercentage = 0.0;
        _isPlaying = true;
      });

      audioPlayer.onPlayerCompletion.listen((_) {
        setState(() {
          _isPlaying = false;
          _completedPercentage = 0.0;
        });
      });

      audioPlayer.onDurationChanged.listen((duration) {
        setState(() {
          _totalDuration = duration.inMicroseconds;
        });
      });

      audioPlayer.onAudioPositionChanged.listen((duration) {
        setState(() {
          _currentDuration = duration.inMicroseconds;
          _completedPercentage = _currentDuration.toDouble() / _totalDuration.toDouble();
        });
      });
    } else {
      //is playing, so pause
      audioPlayer.pause();
      setState(() {
        _isPlaying = false;
        _isPaused = true;
      });
    }
  }
}
