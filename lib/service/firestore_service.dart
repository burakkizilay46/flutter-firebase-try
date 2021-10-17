import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  var instance = FirebaseFirestore.instance;

  CollectionReference getCollection(){
    return FirebaseFirestore.instance.collection("todo");
  }

  
}
