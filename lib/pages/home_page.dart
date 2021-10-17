import 'package:firestore_example/model/model_todo.dart';
import 'package:firestore_example/pages/add_todo.dart';
import 'package:firestore_example/service/firebase_todo_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            // With MaterialPageRoute, you can pass data between pages,
            // but if you have a more complex app, you will quickly get lost.
            MaterialPageRoute(
              builder: (context) => SecondPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("TODO"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: FirebaseTodoService().getTodo(),
            builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
              if (snapshot.hasData) {
                var todos = snapshot.data;
                return ListView.builder(
                    itemCount: todos!.length,
                    itemBuilder: (context, index) {
                      var todo = todos[index];
                      return ListTile(
                        title: Text(todo.taskTitle),
                        subtitle: Text(todo.isDone.toString()),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Hata Var!!"),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
