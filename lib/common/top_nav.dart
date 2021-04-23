import 'package:flutter/material.dart';

class TopNav extends StatelessWidget{

  final bool includeProfilePicture;
  final bool includeBackButton;
  final String profilePicturePath;
  final VoidCallback onPop;

  TopNav({
    Key key,
    @required this.includeBackButton,
    @required this.includeProfilePicture,
    this.onPop,
    this.profilePicturePath = 'assets/images/person_placeholder.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 30.0, 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Visibility(
                visible: includeBackButton,
                child: IconButton(
                  icon: Icon(
                      Icons.chevron_left_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    if (onPop != null)
                      onPop();
                    Navigator.pop(context);
                    },
                ),
              ),
              Visibility(
                visible: includeProfilePicture,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/person_placeholder.png'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        )
      ]
    );
  }
}
