import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/page_transition.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';
import 'create_news.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  var controller;
  // final Duration animationDuration = Duration(milliseconds: 300);
  // final Duration delay = Duration(milliseconds: 300);
  // GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  // late Rect rect;

  // void _onTap() async {
  // setState(() => rect = RectGetter.getRectFromKey(rectGetterKey)!); //<--onTap, update rect

  // }

  @override
  Widget build(BuildContext context) {
    return
        // Stack( //<-- Wrap Scaffold with a Stack
        //   children: <Widget>[
        Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'My News',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
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
      floatingActionButton:
          // RectGetter(           //<-- Wrap Fab with RectGetter
          // key: rectGetterKey,                       //<-- Passing the key
          // child:
          FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.create_outlined),
        onPressed: () {
          // _onTap();
          Navigator.of(context).push(FadeRouteBuilder(child: AppImagePicker()));
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
  var userNews = [];
  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
      getuserNews();
    }
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
            title: Text(
              userNews[index]['title'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              userNews[index]['description'].toString(),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 22,
              ),
              onPressed: () async {
                deluserNews(index);
                getuserNews();
              },
            ),
          ));
        },
        itemCount: userNews.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  getuserNews() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/post/user',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));
    print(resp);
    try {
      if (resp.data['status']) {
        userNews = resp.data['result'];
        Log.i('0_length', userNews.length.toString());
      }
    } catch (e, s) {
      print(e.toString() + s.toString());
    }

    Timer(
      Duration(seconds: 1),
      () {
        setState(() {});
      },
    );
  }
  deluserNews(var delIndex) async {
    Response? resp = null;
    var deleteNews = userNews[delIndex]['_id'].toString();
    print(deleteNews);
    resp = await Dio().delete(Configuration.serverUrl + '/news?newsId='+deleteNews,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));
    print(resp);
    try {
      if (resp.data['status']) {
        ToastUtil.success(_context!, message: resp.data['message']);
      }
    } catch (e, s) {
      print(e.toString() + s.toString());
    }

    Timer(
      Duration(seconds: 1),
      () {
        setState(() {});
      },
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget child;

  FadeRouteBuilder({
    required this.child,
  }) : super(
          pageBuilder: (context, animation1, animation2) => child,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}
