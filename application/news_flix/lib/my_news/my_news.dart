import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/page_transition.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import '../config/configuration.dart';
import 'submit_news.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  var controller;
  var userNewsList = [];
  @override
  Widget build(BuildContext context) {
    if (context == null) {
      context = context;
      getuserNews();
    }
    return Scaffold(
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Configuration.primaryColor,
            ),
            onPressed: () {
              getuserNews();
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: (userNewsList.isNotEmpty)
          ? ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
            child: Column(
              children: [
                (userNewsList[index]['imageUrl'] != null)? Container(
                  child: Image.network(
                    userNewsList[index]['imageUrl'],
                  ),
                ) : Container(),
                ListTile(
                  title: Text(
                    userNewsList[index]['title'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    userNewsList[index]['description'].toString(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    deluserNews(index);
                    getuserNews();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 22,
                      ),
                      Text('Delete')
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: userNewsList.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      )
          : Container(
        height: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'List is empty.',
              style: TextStyle(
                  color: Configuration.primaryColor, fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton:
      // RectGetter(           //<-- Wrap Fab with RectGetter
      // key: rectGetterKey,                       //<-- Passing the key
      // child:
      FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.create_outlined),
        onPressed: () {
          // _onTap();
          Navigator.of(context).push(FadeRouteBuilder(
            child: SubmitNews(
                callBack: callBackFromPostNews
            ),
          ),
          );
        },
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
        userNewsList = resp.data['result'];
        Log.i('0_length', userNewsList.length.toString());
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
    var deleteNews = userNewsList[delIndex]['_id'].toString();
    print(deleteNews);
    resp = await Dio().delete(
        Configuration.serverUrl + '/news?newsId=' + deleteNews,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));
    print(resp);
    try {
      if (resp.data['status']) {
        ToastUtil.success(context, message: resp.data['message']);
        userNewsList.removeAt(delIndex);
        setState(() {});
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

  callBackFromPostNews() {
    Log.i("calling_get_news_from_submit_news_page");
    getuserNews();
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
