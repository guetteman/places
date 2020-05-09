import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:places/Place/model/place.dart';
import 'package:places/Place/ui/widgets/image_card_with_fab_icon.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String PLACES = "places";

  final Firestore db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {

    DocumentReference reference = db.collection(USERS).document(user.uid);

    await reference.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'places': user.places,
      'favoritePlaces': user.favoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);

  }

  Future<void> updatePlaceData(Place place) async {

    CollectionReference placesReference = db.collection(PLACES);
    final user = await _auth.currentUser();

    DocumentReference placeReference = await placesReference.add({
      "name": place.name,
      "description": place.description,
      "likes": place.likes,
      "urlImage": place.urlImage,
      "owner": db.document("${USERS}/${user.uid}")
    });

    DocumentSnapshot snapshot = await placeReference.get();
    DocumentReference userReference = db.collection(USERS).document(user.uid);
    
    await userReference.updateData({
      'places': FieldValue.arrayUnion([db.document("${PLACES}/${snapshot.documentID}")])
    });

  }

  List<ProfilePlace> buildUserPlaces(List<DocumentSnapshot> placesListSnapshot) {

    List<ProfilePlace> profilePlaces = List<ProfilePlace>();

    placesListSnapshot.forEach((place) {

      profilePlaces.add(ProfilePlace(
        Place(
          name: place.data['name'],
          description: place.data['description'],
          urlImage: place.data['urlImage'],
          likes: place.data['likes']
        )
      ));

    });

    return profilePlaces;

  }

  List<ImageCardWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {

    List<ImageCardWithFabIcon> places = List<ImageCardWithFabIcon>();

    placesListSnapshot.forEach((place) {

      places.add(
        ImageCardWithFabIcon(
          imagePath: place.data['urlImage'],
          iconData: Icons.favorite_border,
          width: 350.0,
          height: 250.0,
          left: 20.0,
          onPressedFabIcon: () {

          }
        )
      );

    });

    return places;

  }

}
