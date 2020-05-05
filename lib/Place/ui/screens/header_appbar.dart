import 'package:flutter/material.dart';
import 'package:places/Place/ui/widgets/image_card_list.dart';
import 'package:places/widgets/gradient_background.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackground(height: 300.0),
        ImageCardList()
      ],
    );
  }

}
