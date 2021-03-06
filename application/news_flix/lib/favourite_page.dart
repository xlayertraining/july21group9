import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/full_view.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  // List<String> images = [
  //   "assets/default-avatar.jpg",
  //   "assets/default-avatar.jpg",
  //   "assets/default-avatar.jpg",
  //   "assets/default-avatar.jpg",
  //   "assets/default-avatar.jpg",
  //   "assets/default-avatar.jpg",
  // ];
  var usrFav = [];
  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
      getuserFavourites();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          "Favourites",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    usrFav[index]['title'].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                  subtitle: Text(
                    usrFav[index]['description'].toString(),
                  ),
                ),
                Divider(
                  color: Colors.deepPurple,
                  indent: 10,
                  endIndent: 10,
                ),
                (usrFav[index]['imageUrl'] != null)
                    ? Container(
                        child: Image.network(
                          usrFav[index]['imageUrl'],
                        ),
                      )
                    : Container(),
                Divider(
                  color: Colors.deepPurple,
                  indent: 10,
                  endIndent: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    delUserFav(index);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: Colors.deepPurple),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 22,
                      ),
                      Text('DELETE')
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: usrFav.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }
  getuserFavourites() async {
    Response? response = null;
    try {
      response = await Dio().get(Configuration.serverUrl + "/news/favourites",
          options: Options(headers: {
            'Authorization': ' Bearer ' + Configuration.authToken
          }));
      print(response);
    } catch (e, s) {
      print(e.toString() + s.toString());
    }

    try {
      if (response!.data['status']) {
        usrFav = response.data['result'];
      }
    } catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    Timer(
      Duration(milliseconds: 150),
      () {
        setState(() {});
      },
    );
  }

  delUserFav(var id) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": usrFav[id]['_id'].toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/favourites',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
    try {
      if (resp.data['status']) {
        ToastUtil.success(
          _context!,
          message: resp.data['message'],
        );
      }
    } catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    Timer(
      Duration(milliseconds: 150),
      () {
        setState(() { getuserFavourites();});
      },
    );
  }
}
