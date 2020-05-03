import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            CircleButton(
              mini: true,
              icon: Icons.vpn_key,
              iconSize: 20.0,
              color: Color.fromRGBO(255, 255, 255, 1),
              onPressed: () {

              },
            ),
            CircleButton(
              mini: false,
              icon: Icons.add,
              iconSize: 40.0,
              color: Color.fromRGBO(255, 255, 255, 1),
              onPressed: () {

              },
            ),
            CircleButton(
              mini: true,
              icon: Icons.exit_to_app,
              iconSize: 20.0,
              color: Color.fromRGBO(255, 255, 255, 1),
              onPressed: () {
                userBloc.signOut();
              },
            ),
          ],
        )
    );
  }

}
