import 'package:firestore_example/constants/firebase_constants.dart';
import 'package:firestore_example/model/model_todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoService {
  Future<List<Todo>> getTodo() async {
    List<Todo> todos = [];

    QuerySnapshot querySnapshot = await todosRef.get();

    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Todo todoObject =
          Todo.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      // TODO: Bunun nedenini araştır!!!
      todos.add(todoObject);
    }

    return todos;
  }

  Future<void> addTodo(Todo todo) async {
    return await todosRef.add(todo.toJson()).then((referans) async {
      await todosRef.doc(referans.id).update({
        //'todoId' = referans.id,
        //TODO: Araştır!!!
      });
    });
  }
}
