import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/Homepage.dart';

import 'package:untitled2/sign_in_page.dart';

class SplashScreen extends StatelessWidget {

  BuildContext? _context;

  @override
  Widget build(BuildContext context) {

    if (_context == null) {
      _context = context;
      initTimer();
    }

    return Scaffold(
      body: Container(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.5,
                      0.8,
                      0.7
                    ],
                    colors: [
                    Colors.blue.shade50,
                    Colors.blue.shade100,
                    Colors.blue.shade200,
                    Colors.blue.shade300,
                  ]
                )
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/News Flix.png",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
              Text("NEWS FLIX",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 15.0,),
            Text(
              "Unfolding The Truth",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  void initTimer() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var signedInValue = await prefs.getString(Configuration.signedInKey);
    print(signedInValue);
    if (signedInValue == null) {
      Timer(Duration(seconds:3), () {
        Navigator.of(_context!).pushReplacement(
            MaterialPageRoute(builder: (context) => Myapp())
        );
      }
      );
    } else {
      Timer(Duration(seconds:3), () {
        Navigator.of(_context!).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );
      }
      );
    }
  }

}
