import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchKeyWord = new TextEditingController();
  var newstile = [];
  bool searchResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined,
                  color: Colors.white), // set your color here
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // The search area here
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: searchKeyWord,
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () {
                            searchNews();
                          },
                        ),
                      ),
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none),
                ),
              ),
            )),
        body:  (searchResult == true) ?
        ListView.builder(
            itemCount: newstile.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    ToastUtil.info(
                      context,
                      message: 'This feature is comming soon.',
                    );
                    // Scaffold.of(context).showSnackBar(SnackBar(
                    //   content: Text(titles[index] + ' pressed!'),
                    // ));
                  },
                  title: Text(newstile[index]['title'].toString(),
                  style: TextStyle(color: Colors.deepPurple),),
                  subtitle: Text(newstile[index]['description'].toString(),
                    style: TextStyle(color: Colors.black),),
                leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://blog.online.colostate.edu/wp-content/uploads/2013/10/Focus.jpg")),
                  selected: true,
                ),
              );
            }
            ):Container(),
    );
  }
  searchNews() async {
    Response? resp = null;
    resp = await Dio().get(
        Configuration.serverUrl + '/news/search?keyword=' + searchKeyWord.text,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      if (resp.data['status']){
        newstile = resp.data['result'];
        print(resp);
        searchResult = true;
        Log.i('0_length', newstile.length.toString());
        ToastUtil.success(
          context,
          message: resp.data['message'],
        );
      }
      else{
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
