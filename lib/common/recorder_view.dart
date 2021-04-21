import 'dart:developer';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';

//Code retrieved from https://www.youtube.com/watch?v=_LXp1Lgfdk0
class RecorderView extends StatefulWidget {

  final Function(String filePath) onSaved;

  const RecorderView ({Key key, @required this.onSaved}) : super(key: key);

  @override
  _RecorderViewState createState() => _RecorderViewState();
}

class _RecorderViewState extends State<RecorderView> {

  IconData _recordIcon = Icons.mic_none;
  bool _isRecording = false;

  LocalFileSystem _localFileSystem;

  String _recordingPath;

  var _microphonePermissionStatus;
  var _storagePermissionStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(onLayoutDone);
  }

  void onLayoutDone(Duration timeStamp) async {
    _storagePermissionStatus = await Permission.storage.status;
    _microphonePermissionStatus = await Permission.storage.status;
    _isRecording = await AudioRecorder.isRecording;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _recordIcon,
        color: _isRecording ? Colors.red : Colors.black,
        size: 40,
      ),
      onPressed: () async {
        await _onRecordButtonPressed();
        setState((){});
      },

    );
  }

  Future<void> _onRecordButtonPressed() async {
    _requestPermissions();
    if (_havePermissions()) {
      if (_isRecording) {
        _startRecording();
      } else {
        _stopRecording();
      }
    }
  }

  Future<void> _startRecording() async {
    io.Directory appDirectory = await getExternalStorageDirectory();
    var recordingPath = appDirectory.path + '/' + DateTime.now().millisecondsSinceEpoch.toString() + '.aac';

    await AudioRecorder.start(path: recordingPath, audioOutputFormat: AudioOutputFormat.AAC);

    var isRecording = await AudioRecorder.isRecording;
    var recordIcon = Icons.stop;

    setState(() {
      _recordingPath = recordingPath;
      _isRecording = isRecording;
      _recordIcon = recordIcon;
    });
  }


  _stopRecording() async {
    var recording = await AudioRecorder.stop();
    log("recording stopped: " + recording.path);
    var recordIcon = Icons.mic;
    var isRecording = await AudioRecorder.isRecording;

    setState(() {
      _recordIcon = recordIcon;
      _isRecording = isRecording;
    });

    widget.onSaved(_recordingPath);
  }

  bool _havePermissions() {
    return _microphonePermissionStatus == PermissionStatus.granted && _storagePermissionStatus == PermissionStatus.granted;
  }

  void _requestPermissions() async {
    if (await Permission.microphone.request().isGranted && await Permission.storage.request().isGranted) {
      _microphonePermissionStatus = await Permission.microphone.status;
      _storagePermissionStatus = await Permission.storage.status;
      setState(() {});
    }
  }


}
