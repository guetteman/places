import 'package:flutter/material.dart';
import 'package:places/widgets/floating_action_button_green.dart';

class ImageCardWithFabIcon extends StatelessWidget {

  final double height;
  final double width;
  final String imagePath;
  final IconData iconData;
  final VoidCallback onPressedFabIcon;
  double left;

  ImageCardWithFabIcon({
    Key key,
    @required this.imagePath,
    @required this.height,
    @required this.width,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.left
  });

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: this.height,
      width: this.width,
      margin: EdgeInsets.only(
          left: this.left
      ),

      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(this.imagePath)
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow (
                color:  Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.2),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: this.iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }

}
