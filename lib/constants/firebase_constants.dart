import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;
final storageRef = FirebaseStorage.instance.ref();

final CollectionReference todosRef = firestore.collection('todos');