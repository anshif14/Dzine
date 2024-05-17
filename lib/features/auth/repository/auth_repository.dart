import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xfashion/core/Providers/providers.dart';
import 'dart:io';


final authRepositoryProvider = Provider((ref) => authRepository(firestore: ref.watch(firebaseProvider), auth: ref.watch(firebaseauthProvider), storage: ref.watch(storageProvider)));


class authRepository {
  final FirebaseFirestore _firestore ;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  authRepository({required FirebaseFirestore firestore, required FirebaseAuth auth, required FirebaseStorage storage}):
        _firestore= firestore , _auth=auth,_storage = storage;
  
  
  CollectionReference get _settings => _firestore.collection('settings');

  Reference get _upload => _storage.ref('uploads');
  
 getTerms() async {

     var data = await   _settings.doc('settings').get();

    return data.data();
  }

  uploadToFirebase(File file)async{
var upload = await _upload.child(DateTime.now().toString()).putFile(file);

var getUrl = await upload.ref.getDownloadURL();
print(getUrl);

return getUrl;

  }


}