import 'package:flutter/material.dart';

import 'CreatePost.dart';

class MyPost extends StatelessWidget {
  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('My Posts',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MyPostBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.create_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppImagePicker(),
            ),
          );
          print("UPLOAD");
        },
      ),
    );
  }
}

class MyPostBody extends StatefulWidget {
  const MyPostBody({Key? key}) : super(key: key);

  @override
  _MyPostBodyState createState() => _MyPostBodyState();
}

class _MyPostBodyState extends State<MyPostBody> {
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
                backgroundImage: NetworkImage(
                    'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                // backgroundImage: AssetImage(images[index]),
              ),

              // title: Text("This is Post Title"),
              // subtitle: Text("This is Post Description"),
              title: Text(
                'Samyadeep',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Samyadeep@gmail.com'),

              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 22,
                ),
                onPressed: () {},
              ),
            )
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