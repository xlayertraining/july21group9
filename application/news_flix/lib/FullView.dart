import 'package:flutter/material.dart';
class FullView extends StatefulWidget {
  const FullView({Key? key}) : super(key: key);

  @override
  _FullViewState createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full View'),
        backgroundColor: Colors.blue,
        toolbarHeight: 70,
        actions: [
          Container(
            width: 50,
            child: Image.asset("assets/news.png"
            ),
              height: 200,
            ),
        ],
      ),
    );
  }
}

