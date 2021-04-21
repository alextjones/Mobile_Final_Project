import 'package:flutter/material.dart';

class LevelTitle extends StatefulWidget {

  final bool isUnlocked;
  final String title;

  LevelTitle({
    Key key,
    @required this.isUnlocked,
    @required this.title,
  }) : super(key: key);

  _LevelTitleState createState() => _LevelTitleState();

}

class _LevelTitleState extends State<LevelTitle> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      child: Row(
        children: <Widget> [
          Text(
            widget.title,
            style: TextStyle (
              fontSize: 22.4,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(widget.isUnlocked? Icons.lock_open_rounded : Icons.lock_rounded),
        ],
      ),
    );
  }
}
