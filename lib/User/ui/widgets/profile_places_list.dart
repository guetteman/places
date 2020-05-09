import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/Place/model/place.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'package:places/User/model/user.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {

  User user;

  ProfilePlacesList({
    Key key,
    this.user
  });

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.userPlacesStream(this.user.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Column(
                children: userBloc.buildUserPlaces(snapshot.data.documents),
              );
              break;
            case ConnectionState.done:
              return Column(
                children: userBloc.buildUserPlaces(snapshot.data.documents),
              );
              break;
            case ConnectionState.waiting:
            case ConnectionState.none:
            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );

  }

}
