import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:untitled2/Loginpg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds:3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Myapp())
      );
    }
    );

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
            Image.asset("assets/news.png",
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
}
