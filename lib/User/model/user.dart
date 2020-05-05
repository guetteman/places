import 'package:flutter/material.dart';
import 'package:places/Place/model/place.dart';

class User {

  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place> places;
  final List<Place> favoritePlaces;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.places,
    this.favoritePlaces
  });

}
