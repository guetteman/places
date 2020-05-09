
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'image_card_with_fab_icon.dart';

class ImageCardList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of(context);

    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return placesListView(userBloc.buildPlaces(snapshot.data.documents));
              break;
            case ConnectionState.done:
              return placesListView(userBloc.buildPlaces(snapshot.data.documents));
              break;
            case ConnectionState.waiting:
            case ConnectionState.none:
            default:
              return CircularProgressIndicator();
          }
        },
      )
    );
  }

  Widget placesListView(List<ImageCardWithFabIcon> cardList) {
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: cardList,
    );
  }

}
