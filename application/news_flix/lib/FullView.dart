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
      ),
       body: SingleChildScrollView(
       child: Column(
        children:[
          Padding(padding: EdgeInsets.fromLTRB(10, 10,10,10)),
          TextField(
            decoration: InputDecoration(
              labelText: "Title :",
              labelStyle: TextStyle(color: Colors.blue),
            ),
            maxLength: 200,
            maxLines: 3,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width/2,
            child:
            Image.network(
                'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-old-paper-texture-parchment-background-image_354980.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Description :",
              labelStyle: TextStyle(color: Colors.blue),
            ),
            maxLines: 8,
            maxLength: 2000,
          ),
          ]
       )
       ),
      );
  }
}
