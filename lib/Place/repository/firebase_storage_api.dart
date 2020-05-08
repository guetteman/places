import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {

  final StorageReference storageReference = FirebaseStorage.instance.ref();

  Future<StorageUploadTask> uploadFile(String path, File image) async {
    return storageReference.child(path).putFile(image);
  }

}
