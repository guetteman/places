import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/Place/model/place.dart';
import 'package:places/Place/ui/widgets/image_card_with_fab_icon.dart';
import 'package:places/Place/ui/widgets/location_input.dart';
import 'package:places/User/bloc/user_bloc.dart';
import 'package:places/widgets/gradient_background.dart';
import 'package:places/widgets/header_title.dart';
import 'package:places/widgets/purple_button.dart';
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

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
                    height: 250.0,
                    width: 350.0,
                    left: 0.0,
                    iconData: Icons.camera,
                    onPressedFabIcon: () {}
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                ),
                Container(
                  width: 70.0,
                  child: PurpleButton(buttonText: "Add place", onPressed: () async {

                    final user = await userBloc.currentUser;

                    if (user != null) {
                      String uid = user.uid;
                      String path = "${uid}/${DateTime.now().toString()}.jpg";

                      StorageUploadTask storageUploadTask =  await userBloc.uploadFile(path, widget.image);
                      StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;
                      String urlImage = await snapshot.ref.getDownloadURL();

                      userBloc.updatePlacesData(
                        Place(
                          name: titleController.text,
                          description: descriptionController.text,
                          urlImage: urlImage,
                          likes: 0,
                        )
                      ).whenComplete(() => Navigator.pop(context));
                    }

                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }

}
