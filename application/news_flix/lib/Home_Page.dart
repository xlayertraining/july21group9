import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "NEWS FLIX",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.lightGreenAccent,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.notifications),
            label: "Notification",
            backgroundColor: Colors.yellowAccent,
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            label: "Person",
            backgroundColor: Colors.pinkAccent,
          ),
        ],
        onTap: (index){
    setState(() {
    _currentIndex = index;
    });
    }
      ),

      );

  }
}

