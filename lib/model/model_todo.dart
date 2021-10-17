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
    });

    String taskTitle;
    bool isDone;

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        taskTitle: json["taskTitle"],
        isDone: json["isDone"],
    );

    Map<String, dynamic> toJson() => {
        "taskTitle": taskTitle,
        "isDone": isDone,
    };
}
