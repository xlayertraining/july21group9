import 'package:flutter/material.dart';

class Likers extends StatelessWidget {
  const Likers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Liked By'),
        backgroundColor: Colors.deepPurpleAccent.shade200,

      ),
      body: LikedBy(),
    );
  }
}
class LikedBy extends StatefulWidget {
  const LikedBy({Key? key}) : super(key: key);

  @override
  _LikedByState createState() => _LikedByState();
}

class _LikedByState extends State<LikedBy> {
  List<String> images = [
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(images[index]),
              ),
              title: Text("Samyadeep Saha"),
              subtitle: Text("BadBoy Samya"),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 22,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
