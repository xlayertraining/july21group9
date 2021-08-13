import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
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
      ),
      body: MyPostBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
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
            itemBuilder: (BuildContext, index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
              title: Text("This is Post Title"),
              subtitle: Text("This is Post Description"),
            ),
          );
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        )
        );
      }
    }