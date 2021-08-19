import 'dart:convert';

import 'package:flutter/material.dart';

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

class MyWidget2 extends StatefulWidget {
  @override
  _MyWidget2State createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
            body: Container(
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        top: 80,
                      )),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 35.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                            child: Column(children: [
                              TextField(
                                  decoration: InputDecoration(
                                labelText: "First name :",
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                labelText: "last name :",
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                labelText: " Phone No.",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:
                                    Icon(Icons.phone, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:
                                    Icon(Icons.email, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black),
                                  suffixIcon: Icon(Icons.visibility_off,
                                      color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                // createAlbum("test string");
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                              ),
                            ]
                            ),
                          margin: EdgeInsets.only(
                          top: 100,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(55.0),
                            topRight: Radius.circular(55.0),
                          ),
                        ),
                        ),
                      )
                    ]
                )
            )
    );
  }
}