import 'package:flutter/material.dart';

import 'CreatePost.dart';

class MyPost extends StatelessWidget {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My Posts'),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue.shade400, Colors.cyan.shade100]))),
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Image.network(
                  'https://images.wallpapersden.com/image/download/itachi-uchiha-anime_a2xuZmiUmZqaraWkpJRnbmhnrWduaGc.jpg'),
              onPressed: () {},
            ),
          ]),
      body: MyPostBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppImagePicker(
                key: controller.initialize().then((_) {}),
                maxImageWidth: controller.initialize().then((_) {}),
                maxImageHeight: controller.initialize().then((_) {}),
                onImageSelected: (File) {},
              ),
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
                backgroundImage: AssetImage(images[index]),
              ),
              title: Text("This is Post Title"),
              subtitle: Text("This is Post Description"),
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
