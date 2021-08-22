import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          "Favourites",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.2,
              0.4,
              0.6,
              0.8,
            ],
            colors: [
              Colors.white,
              Colors.purpleAccent.shade200,
              Colors.purpleAccent.shade400,
              Colors.purpleAccent.shade700,
            ],
          )),
        ),
      ),
    );
  }
}
