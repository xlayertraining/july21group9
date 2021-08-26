import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;
import 'package:untitled2/SplashScreen.dart';
import 'package:untitled2/Homepage.dart';

Future<http.Response> createAlbum(String title) {
  print("Hello");
  return http.post(
    Uri.parse('https://api.xlayer.in/julygroup9_web/api/sign/up'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "firstName": "Sam",
      "lastName": "Jhonson",
      "phoneNumber": "9655870115",
      "emailAddress": "test4@gmail.com",
      "password": "moinvwuondvoncs"
    }),
  );
}

class SignUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS FLIX',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  BuildContext? _context;
  bool passShow = false;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "First name :",
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: "Last name :",
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      suffixIcon: Icon(
                        Icons.person
                      )
                    )),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      suffixIcon: Icon(Icons.email, color: Colors.lightBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password.",
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      suffixIcon: Icon(Icons.phone, color: Colors.lightBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      suffixIcon: Icon(Icons.phone, color: Colors.lightBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  // createAlbum("test string");
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
