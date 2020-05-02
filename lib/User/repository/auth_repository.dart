import 'package:firebase_auth/firebase_auth.dart';
import 'package:places/User/repository/firebase_auth.dart';

class AuthRepository {

  final _auth = FirebaseAuthentication();

  Future<FirebaseUser> signIn () => _auth.signIn();

}
