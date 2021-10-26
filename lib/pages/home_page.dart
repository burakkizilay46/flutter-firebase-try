import 'package:firestore_example/model/model_todo.dart';
import 'package:firestore_example/service/firebase_todo_service.dart';

import 'package:flutter/material.dart';

import 'add_todo.dart';

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
          Navigator.of(context).push(
            // With MaterialPageRoute, you can pass data between pages,
            // but if you have a more complex app, you will quickly get lost.
            MaterialPageRoute(
              builder: (context) => AddTodo(),
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
                return RefreshIndicator(
                  displacement: 50,
                  onRefresh: _refresh,
                  child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: todos!.length,
                      itemBuilder: (context, index) {
                        Todo todo = todos[index];
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: ValueKey(todos[index]),
                          child: buildTodoWidget(todo),
                          onDismissed: (direction) {
                            FirebaseTodoService().deleteTask(todo);
                            setState(() {});
                          },
                          background: Container(
                            child: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        );
                      }),
                );
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

  Future<void> _refresh() async {
    setState(() {});
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
