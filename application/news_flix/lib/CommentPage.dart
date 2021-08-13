import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPage createState() => _CommentPage();
}

class _CommentPage extends State<CommentPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Sam Jhonson',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Super Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Bat Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Iron  Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  bool get withBorder => true;

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: CommentBox(
          userImage:
          "https://images.wallpapersden.com/image/download/itachi-uchiha-anime_a2xuZmiUmZqaraWkpJRnbmhnrWduaGc.jpg",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },

          formKey: formKey,
         // title: Form(
         //  key: formKey, child: TextFormField(
         //   decoration: InputDecoration(
         //   border: !withBorder
         //      ? InputBorder.none
         //      : UnderlineInputBorder(
         //    borderSide: BorderSide(color: Colors.),
         //  ),
          commentController: commentController,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black),
        ),
      ),
    );
  }
}