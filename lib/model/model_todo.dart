// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    required this.taskTitle,
    required this.isDone,
    required this.todoId,
  });

  String taskTitle;
  String todoId;
  bool isDone;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        taskTitle: json["taskTitle"],
        isDone: json["isDone"],
        todoId: json["todoId"],
      );

  Map<String, dynamic> toJson() => {
        "taskTitle": this.taskTitle,
        "isDone": this.isDone,
        "todoId": this.todoId,
      };
}
