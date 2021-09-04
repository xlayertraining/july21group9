import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({Key? key}) : super(key: key);

  @override
  _AllNewsPageState createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  var newstile = [];
  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
      getApproveNews();
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'All news',
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
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(4),
                color: Colors.white60,
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "News:",
                  style: TextStyle(fontSize: 25, color: Colors.deepPurple),
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 8, right: 8),
              height: 500,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: newstile.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: Column(
                          children: [
                            (newstile[index]['imageUrl'] != null)
                                ? Container(
                                    child: Image.network(
                                      newstile[index]['imageUrl'],
                                      width: 300,
                                      height: 300,
                                    ),
                                  )
                                : Container(
                                    width: 300,
                                    height: 300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      " No image is provided.",
                                    ),
                                  ),
                            Container(
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      primary: Colors.white),
                                  child: Text(
                                    'Approve',
                                    style: TextStyle(
                                        color: Colors.deepPurple, fontSize: 15),
                                  ),
                                  onPressed: () {
                                    postApproveNews(
                                        newstile[index]['_id'].toString());
                                    getApproveNews();
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      primary: Colors.deepPurple),
                                  child: Text('Delete'),
                                  onPressed: () async {
                                    delApproveNews(newstile[index]['_id'].toString());
                                    getApproveNews();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  getApproveNews() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news/approve',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      if (resp.data['status']) {
        newstile = resp.data['result'];
      } else {
        ToastUtil.error(
          context,
          message: resp.data['message'],
        );
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

  postApproveNews(var news_id) async {
    var newspost = FormData.fromMap({"newsId": news_id});
    Response? resp = null;
    resp = await Dio().post(Configuration.serverUrl + '/news/approve',
        data: newspost,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      if (resp.data['status']) {
        ToastUtil.success(
          context,
          message: resp.data['message'],
        );
      } else {
        ToastUtil.error(
          context,
          message: resp.data['message'],
        );
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
  delApproveNews(var news_id) async {
    Response? resp = null;
    resp = await Dio().delete(Configuration.serverUrl + '/news/approve?newsId='+news_id.toString(),
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      if (resp.data['status']) {
        ToastUtil.success(
          context,
          message: resp.data['message'],
        );
      } else {
        ToastUtil.error(
          context,
          message: resp.data['message'],
        );
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
