import 'package:firebase_auth/firebase_auth.dart';
import 'package:places/User/repository/firebase_authentication.dart';

class AuthRepository {

  final firebaseAuthentication = FirebaseAuthentication();

  Future<FirebaseUser> signIn () => firebaseAuthentication.signIn();
  signOut() => firebaseAuthentication.signOut();
}
