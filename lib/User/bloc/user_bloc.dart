import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/model/user.dart';
import 'package:places/User/repository/auth_repository.dart';
import 'package:places/User/repository/cloud_firestore_repository.dart';


class UserBloc implements Bloc {

  final authRepository = AuthRepository();
  Stream<FirebaseUser> firebaseStream = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => firebaseStream;

  final cloudFirestoreRepository = CloudFirestoreRepository();

  Future<FirebaseUser> signIn() {
    return authRepository.signIn();
  }

  void updateUserData(User user) => cloudFirestoreRepository.updateUserDataInFirestore(user);

  signOut() {
    authRepository.signOut();
  }

  @override
  void dispose() {

  }

}
