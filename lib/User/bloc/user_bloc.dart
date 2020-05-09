import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/Place/model/place.dart';
import 'package:places/Place/repository/firebase_storage_repository.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/repository/auth_repository.dart';
import 'package:places/User/repository/cloud_firestore_api.dart';
import 'package:places/User/repository/cloud_firestore_repository.dart';
import 'package:places/User/ui/widgets/profile_place.dart';


class UserBloc implements Bloc {

  final authRepository = AuthRepository();
  final cloudFirestoreRepository = CloudFirestoreRepository();
  final firebaseStorageRepository = FirebaseStorageRepository();

  Stream<FirebaseUser> firebaseStream = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => firebaseStream;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  Future<FirebaseUser> signIn() => authRepository.signIn();

  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;


  void updateUserData(User user) => cloudFirestoreRepository.updateUserDataInFirestore(user);

  Future<void> updatePlacesData(Place place) => cloudFirestoreRepository.updatePlacesDataInFirestore(place);
  Future<StorageUploadTask> uploadFile(String path, File image) => firebaseStorageRepository.uploadFile(path, image);
  List<ProfilePlace> buildUserPlaces(List<DocumentSnapshot> placesListSnapshot) => cloudFirestoreRepository.buildUserPlaces(placesListSnapshot);

  Stream<QuerySnapshot> userPlacesStream(String uid) =>
      Firestore.instance.collection(CloudFirestoreAPI().PLACES)
          .where("owner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))
          .snapshots();

  signOut() {
    authRepository.signOut();
  }

  @override
  void dispose() {

  }

}
