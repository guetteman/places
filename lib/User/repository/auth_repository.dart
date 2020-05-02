import 'package:firebase_auth/firebase_auth.dart';
import 'package:places/User/repository/firebase_authentication.dart';

class AuthRepository {

  final auth = FirebaseAuthentication();

  Future<FirebaseUser> signIn () => auth.signIn();

}
