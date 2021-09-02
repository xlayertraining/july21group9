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
        title: Text(
          'Full View',
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
        backgroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            height: 700,
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'Title :',
            textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                child: Image.network(
                  'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-old-paper-texture-parchment-background-image_354980.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'description :',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ])),
      ),
    );
  }
}
