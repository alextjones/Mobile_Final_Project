import 'package:flutter/material.dart';

class ThinButton extends StatefulWidget {

  final Widget child;
  final VoidCallback onThinButtonPressed;
  final Color pressedColor;

  ThinButton({
    Key key,
    @required this.child,
    @required this.onThinButtonPressed,
    this.pressedColor,
  }) : super(key: key);

  _ThinButtonState createState() => _ThinButtonState();

}

class _ThinButtonState extends State<ThinButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: ElevatedButton(
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
          onPressed: widget.onThinButtonPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.child,
              Icon(Icons.chevron_right_rounded),
            ],
          )
      )
    );
  }
}
