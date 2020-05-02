import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:places/User/repository/auth_repository.dart';


class UserBloc implements Bloc {

  final authRepository = AuthRepository();
  Stream<FirebaseUser> firebaseStream = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => firebaseStream;

  Future<FirebaseUser> signIn() {
    return authRepository.signIn();
  }

  @override
  void dispose() {

  }

}
