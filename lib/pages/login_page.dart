import 'package:firestore_example/pages/home_page.dart';
import 'package:firestore_example/pages/register_page.dart';
import 'package:firestore_example/service/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login", style: GoogleFonts.quicksand()),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36),
                  ),
                  color: Colors.cyan,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 144, left: 36, right: 36),
                  child: ListView(
                    children: [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(height: 36),
                      Container(
                        child: TextField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Username"),
                        ),
                      ),
                      SizedBox(height: 36),
                      Container(
                        child: TextField(
                          controller: _userPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Container(
                        height: 42,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black38),
                          ),
                          onPressed: () {
                            if (loginMethod()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              );
                            } else {
                              debugPrint("Giriş yapılamadı");
                            }
                          },
                          child: Text("LOG IN"),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.3,
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage("assets/images/todoapp.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool loginMethod() {
    bool isDone = false;
    Auth()
        .logIn(_userNameController.text, _userPasswordController.text)
        .then((value) {
      value == true ? isDone = value : isDone = false;
    });
    return isDone;
  }
}
