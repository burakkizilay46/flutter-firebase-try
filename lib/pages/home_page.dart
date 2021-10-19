import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_example/model/model_todo.dart';
import 'package:firestore_example/service/firebase_todo_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo().whenComplete(() {
            setState(() {});
          });
          //Navigator.of(context).push(
          //  // With MaterialPageRoute, you can pass data between pages,
          //  // but if you have a more complex app, you will quickly get lost.
          //  MaterialPageRoute(
          //    builder: (context) => SecondPage(),
          //  ),
          //);
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
                    padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    itemCount: todos!.length,
                    itemBuilder: (context, index) {
                      Todo todo = todos[index];
                      return buildTodoWidget(todo);
                    });
              } else if (snapshot.hasError) {
                print("HATA: ${snapshot.error}");
                return Center(
                  child: Text("Hata Var!! \n"),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Widget buildTodoWidget(Todo item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${item.taskTitle}"),
          InkWell(
            onDoubleTap: () {
              FirebaseTodoService()
                  .updateTodo(Todo(
                      todoId: item.todoId,
                      isDone: !item.isDone,
                      taskTitle: item.taskTitle))
                  .whenComplete(() {
                setState(() {});
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: item.isDone ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> addTodo() async {
  Todo expTodo = Todo(
    isDone: true,
    taskTitle: "deneme",
    todoId: "",
  );
  return FirebaseTodoService().addTodo(expTodo);
}
