

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places/Place/model/place.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/repository/cloud_firestore_api.dart';
import 'package:places/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {

  final cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataInFirestore(User user) => cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlacesDataInFirestore(Place place) => cloudFirestoreAPI.updatePlaceData(place);
  List<ProfilePlace> buildUserPlaces(List<DocumentSnapshot> placesListSnapshot) => cloudFirestoreAPI.buildUserPlaces(placesListSnapshot);
}
