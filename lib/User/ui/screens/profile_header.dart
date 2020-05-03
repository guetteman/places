import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/ui/widgets/button_bar.dart';
import 'package:places/User/ui/widgets/user_info.dart';


class ProfileHeader extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfileHeader();
  }

}

class _ProfileHeader extends State<ProfileHeader> {

  UserBloc userBloc;
  User user;

  final Widget title = Text(
    'Profile',
    style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0
    ),
  );

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.firebaseStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return showProfileData(snapshot);
            break;
          case ConnectionState.done:
            return showProfileData(snapshot);
            break;
          case ConnectionState.waiting:
          case ConnectionState.none:
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                this.title
              ],
            ),
            CircularProgressIndicator(),
            Text("You must to login first")
          ],
        ),
      );
    } else {

      user = User(
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );

      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                this.title
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }

}
