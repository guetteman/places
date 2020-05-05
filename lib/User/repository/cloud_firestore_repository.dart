

import 'package:places/User/model/user.dart';
import 'package:places/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataInFirestore(User user) => cloudFirestoreAPI.updateUserData(user);

}
