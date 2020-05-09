import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/ui/screens/profile_header.dart';
import 'package:places/User/ui/widgets/profile_background.dart';
import 'package:places/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
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
      }
    );

  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          Text("Please login")
        ],
      );
    } else {
      User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl
      );

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user: user),
              ProfilePlacesList(user: user)
            ],
          ),
        ],
      );
    }
  }

}
