import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {

  final String title;

  HeaderTitle({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
      ),
    );
  }

}
