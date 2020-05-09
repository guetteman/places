import 'package:flutter/material.dart';
import 'package:places/User/model/user.dart';

class Place {

  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  User owner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    //this.owner,
    this.likes,
  });

}
