import 'package:firestore_example/model/model_todo.dart';
import 'package:firestore_example/service/firebase_todo_service.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: TextField(
                    controller: myController,
                    decoration: InputDecoration(border: OutlineInputBorder())),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 46,
                width: 256,
                child: RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    getFirebaseService
                        .addTodo(Todo(
                      isDone: false,
                      taskTitle: myController.text,
                      todoId: "",
                    ))
                        .then((value) {
                      if (value) {
                        Navigator.pop(context);
                      }
                    });
                    myController.clear();
                  },
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
