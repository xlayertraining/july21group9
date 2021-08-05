import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
        backgroundColor: Colors.yellow.shade900,
        iconTheme: IconThemeData(color: Colors.white),
    title: Text(
    "Favourite",
    style: TextStyle(
    color: Colors.white,
    fontSize: 24.0,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold),
    ),
        ),
      body: Center(
      child: Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.1,
        0.4,
        0.6,
        0.9,
      ],
      colors: [
        Colors.yellow,
        Colors.red,
        Colors.indigo,
        Colors.teal,
      ],
    )
    ),
    ),
      ),
    );
  }
}
