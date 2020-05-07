
import 'package:flutter/material.dart';
import 'image_card_with_fab_icon.dart';

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
          ImageCardWithFabIcon(
            imagePath: "assets/img/beach_palm.jpeg",
            iconData: Icons.favorite_border,
            width: 350.0,
            height: 250.0,
            onPressedFabIcon: null
          ),
          ImageCardWithFabIcon(
            imagePath: "assets/img/mountain.jpeg",
            iconData: Icons.favorite_border,
            width: 350.0,
            height: 250.0,
            onPressedFabIcon: null
          ),
          ImageCardWithFabIcon(
            imagePath: "assets/img/mountain_stars.jpeg",
            iconData: Icons.favorite_border,
            width: 350.0,
            height: 250.0,
            onPressedFabIcon: null
          ),
          ImageCardWithFabIcon(
            imagePath: "assets/img/river.jpeg",
            iconData: Icons.favorite_border,
            width: 350.0,
            height: 250.0,
            onPressedFabIcon: null
          ),
          ImageCardWithFabIcon(
            imagePath: "assets/img/sunset.jpeg",
            iconData: Icons.favorite_border,
            width: 350.0,
            height: 250.0,
            onPressedFabIcon: null
          ),
        ],
      ),
    );
  }

}
