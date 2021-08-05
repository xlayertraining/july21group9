import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  const Share({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.purpleAccent[78],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Share",
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
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.red, Colors.yellow, Colors.blue, Colors.purple]
              )
          ),
        ),
      ),
    );
  }
}
