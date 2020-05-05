import 'package:firebase_auth/firebase_auth.dart';
import 'package:places/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final firebaseAuthentication = FirebaseAuthApi();

  Future<FirebaseUser> signIn () => firebaseAuthentication.signIn();
  signOut() => firebaseAuthentication.signOut();
}
