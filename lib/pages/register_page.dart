import 'package:firestore_example/service/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  TextEditingController _userName =
      TextEditingController(text: 'furkan@test.com');
  TextEditingController _userPassword = TextEditingController(text: '123456');
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Register", style: GoogleFonts.quicksand()),
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
                          controller: _userName,
                          decoration: InputDecoration(
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Username"),
                        ),
                      ),
                      SizedBox(height: 36),
                      Container(
                        child: TextField(
                          controller: _userPassword,
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black38),
                              ),
                              onPressed: () async {
                                registerController(context);
                              },
                              child: Text("Register"))),
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

  void registerController(BuildContext context) {
    if (_userName.text.isEmpty && _userPassword.text.isEmpty) {
      Auth().register(_userName.text, _userPassword.text).then((value) {
        if (value) {
          _userName.clear();
          _userPassword.clear();
          Navigator.pop(context);
        }
      });
    }
    else{
      debugPrint("boş bırakma!");
    }
  }
}
