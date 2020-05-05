import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places/User/model/user.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String PLACES = "places";

  final Firestore db = Firestore.instance;

  void updateUserData(User user) async {

    DocumentReference reference = db.collection(USERS).document(user.uid);

    reference.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'places': user.places,
      'favoritePlaces': user.favoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);

  }
}
