import 'package:firestore_example/constants/firebase_constants.dart';
import 'package:firestore_example/model/model_todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoService {
  static final FirebaseTodoService _service = FirebaseTodoService._internal();
  FirebaseTodoService._internal();
  factory FirebaseTodoService() => _service;

  Future<List<Todo>> getTodo() async {
    List<Todo> todos = [];

    QuerySnapshot querySnapshot = await todosRef.get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Todo oyuncuObje =
          Todo.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      todos.add(oyuncuObje);
    }

    return todos;
  }

  Future<bool> addTodo(Todo todo) async {
    bool check = false;
     await todosRef.add(todo.toJson()).then((referans) async {
      referans != null ? check = true : check = false;
      await todosRef.doc(referans.id).update({
        'todoId': referans.id,
      });
    });
    return check;
  }

  Future<void> updateTodo(Todo todo) async {
    await todosRef
        .doc(todo.todoId)
        .update(todo.toJson())
        .then((value) async {});
  }

  Future<void> deleteTask(Todo todo) async {
    await todosRef.doc(todo.todoId).delete();
  }
}

FirebaseTodoService getFirebaseService = FirebaseTodoService();
