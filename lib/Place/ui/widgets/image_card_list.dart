
import 'package:flutter/material.dart';
import 'image_card.dart';

class ImageCardList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ImageCard("assets/img/beach_palm.jpeg"),
          ImageCard("assets/img/mountain.jpeg"),
          ImageCard("assets/img/mountain_stars.jpeg"),
          ImageCard("assets/img/river.jpeg"),
          ImageCard("assets/img/sunset.jpeg"),
        ],
      ),
    );
  }

}
