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
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.purple, Colors.blue]
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
                color: Colors.yellowAccent,
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
