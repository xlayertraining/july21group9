import 'package:comment_box/comment/comment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';

class CommentPage extends StatefulWidget {
  String newsId;
  CommentPage({required this.newsId});

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
  var userComment=[];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
            //   leading: GestureDetector(
            //     onTap: () async {
            //       // Display the image in large form.
            //       print("Comment Clicked");
            //     },
            //     child: Container(
            //       height: 50.0,
            //       width: 50.0,
            //       decoration: new BoxDecoration(
            //           borderRadius: new BorderRadius.all(Radius.circular(50))),
            //       child: CircleAvatar(
            //           radius: 50,
            //           backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
            //     ),
            //   ),
              title: Text(
                data[i]['createdBy'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['comment'].toString()),
            ),
          )
      ],
      reverse: true,
    );
  }

  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      getComment();
      _context = context;

    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Comments" + widget.newsId.toString(),
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://images.wallpapersden.com/image/download/itachi-uchiha-anime_a2xuZmiUmZqaraWkpJRnbmhnrWduaGc.jpg",
          child: commentChild(userComment),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () async {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              postComment();
              setState(() {

              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          sendWidget: Icon(
            Icons.send_sharp,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  postComment() async {
    Response? response = null;
    try {
      var comments = FormData.fromMap({
        "newsId": widget.newsId.toString(),
        "comment": commentController.text
      });
      response = await Dio().post(
        Configuration.serverUrl + "/news/comment",
        data: comments,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
      );
      if (response == null)
        ToastUtil.info(context, message: 'Failed please try again later');
      try {
        if (response.data['status'])
          ToastUtil.info(context, message: response.data['message']);
        else
          ToastUtil.error(context, message: response.data['message']);
      } catch (e, s) {
        print(e.toString() + s.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  getComment() async {
    Response? response = null;
    try {
      response = await Dio().get(
        Configuration.serverUrl +
            "/news/comment?newsId=" +
            widget.newsId.toString(),
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
      );
      print(response);
      if (response == null)
        ToastUtil.info(context, message: 'Failed please try again later');
      try {
        if (response.data['status']) {
          userComment = response.data['result'];

          ToastUtil.info(context, message: response.data['message']);
        }else
          ToastUtil.error(context, message: response.data['message']);
      } catch (e, s) {
        print(e.toString() + s.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  getuserProfile() async {
    Response? response = null;
    try {
      response = await Dio().get(Configuration.serverUrl + "/user/profile",
          options: Options(headers: {
            'Authorization': ' Bearer ' + Configuration.authToken
          }));
      print(response);
    } catch (e, s) {
      print(e.toString() + s.toString());
    }
  }
}
