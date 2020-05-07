import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/Place/ui/widgets/image_card_with_fab_icon.dart';
import 'package:places/Place/ui/widgets/location_input.dart';
import 'package:places/widgets/gradient_background.dart';
import 'package:places/widgets/header_title.dart';
import 'package:places/widgets/text_input.dart';

class AddPlaceScreen extends StatefulWidget {

  final File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackground(height: 300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45.0
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 10.0),
                  child: HeaderTitle(title: "Add a new place"),
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: ImageCardWithFabIcon(
                    imagePath: widget.image.path,
                    height: null,
                    width: null,
                    onPressedFabIcon: null,
                    iconData: Icons.camera
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                      hintText: "Title",
                      inputType: null,
                      maxLines: 1,
                      controller: titleController
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: descriptionController
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: LocationInput(
                      hintText: "Add Location",
                      controller: null,
                      iconData: Icons.location_on
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
