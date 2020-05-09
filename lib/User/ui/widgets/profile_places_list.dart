import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/Place/model/place.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;

  Place place = Place(
      name: "Knuckles Mountains Range",
      description: "Hiking. Water fall hunting. Natural bath",
      urlImage: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 3

  );
  Place place2 = Place(
      name: "Mountains",
      description: "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
      urlImage: "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 10
  );

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Column(
                children: userBloc.buildPlaces(snapshot.data.documents),
              );
              break;
            case ConnectionState.done:
              return Column(
                children: userBloc.buildPlaces(snapshot.data.documents),
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
