import 'package:flutter/material.dart';

class ThickButton extends StatefulWidget {

  final String text;
  final VoidCallback onThickButtonPressed;
  final Color pressedColor;

  ThickButton({
    Key key,
    @required this.text,
    @required this.onThickButtonPressed,
    this.pressedColor,
  }) : super(key: key);

  _ThickButtonState createState() => _ThickButtonState();

}

class _ThickButtonState extends State<ThickButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return widget.pressedColor != null? widget.pressedColor : Colors.blue;
                  return Colors.white;
                }
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.white;
                return Colors.black;
              }
            ),
            elevation: MaterialStateProperty.all(2.0),
          ),
          onPressed: widget.onThickButtonPressed,
          child:
          Padding(
            padding: EdgeInsets.fromLTRB(10, 45, 10, 45),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                  widget.text,
                style: TextStyle(
                  fontSize: 22.4,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Icon(Icons.chevron_right_rounded),
            ],
          ),
      )
    );
  }
}
