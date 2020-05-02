import 'package:flutter/material.dart';
import 'package:places/widgets/gradient_background.dart';
import 'package:places/widgets/green_button.dart';

class SignInScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBackground("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Welcome \n This is your travel app",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              GreenButton(
                  text: "Login with Google",
                  width: 300.0,
                  height: 50.0,
                  onPressed: () {

                  }
              )
            ],
          )
        ],
      ),
    );
  }

}
