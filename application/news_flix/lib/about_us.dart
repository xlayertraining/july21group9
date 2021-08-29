import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "About us",
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
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple, Colors.blue]
              )
          ),
        ),
      ),
    );
  }
}