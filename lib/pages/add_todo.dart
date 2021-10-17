import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.

  @override
  Widget build(BuildContext context) {
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
                    print("tıklandı");
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
