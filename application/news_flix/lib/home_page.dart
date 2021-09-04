import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/time_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'about_us.dart';
import 'all_news_page.dart';
import 'comment_page.dart';
import 'my_news/submit_news.dart';
import 'dislikers.dart';
import 'favourite_page.dart';
import 'full_view.dart';
import 'likers.dart';
import 'profile2.dart';

import 'sign_in_page.dart';
import 'my_news/my_news.dart';
import 'search_page.dart';
import 'share.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listTiles0 = [];
  var listTiles1 = [];
  var listTiles2 = [];
  var listTiles3 = [];
  var listTiles4 = [];
  var listTiles5 = [];
  var userName;
  var userEmailAddress;
  var userPhoneNumber;
  int userRole = 0;
  TextEditingController firstNameCon = new TextEditingController();

  BuildContext? _context;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;

      getuserProfile();
      getNewsCategory1();
      getNewsCategory2();
      getNewsCategory3();
      getNewsCategory4();
      getNewsCategory5();
      getNewsCategory6();
    }

    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: Colors.white,
            title: Text(
              "NEWS FLIX",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            // flexibleSpace: Container(
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             colors: [Colors.cyan.shade100, Colors.blue.shade400]))),
            actions: [
              IconButton(
                color: Colors.black,
                iconSize: 28,
                splashRadius: 10,
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Configuration.primaryColor,
                ),
                onPressed: () {
                  getNewsCategory1();
                  getNewsCategory2();
                  getNewsCategory3();
                  getNewsCategory4();
                  getNewsCategory5();
                  getNewsCategory6();
                },
              ),
            ],
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.deepPurple), // set your color here
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),

            bottom: TabBar(
                isScrollable: true,
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.deepPurple,
                indicatorColor: Colors.deepPurple,
                unselectedLabelColor: Colors.grey,
                labelPadding: EdgeInsets.symmetric(horizontal: 15),
                tabs: [
                  Tab(
                    child: Text(
                      "Latest",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "National",
                    ),
                  ),
                  Tab(
                    child: Text("International"),
                  ),
                  Tab(
                    child: Text("Sports"),
                  ),
                  Tab(
                    child: Text("Tech"),
                  ),
                  Tab(
                    child: Text("Business"),
                  ),
                ]),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: listTiles0.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: buildCard(
                      listTiles0[index],
                      catId: 0,
                      position: index,
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  // color: Colors.lightBlueAccent,
                  child: ListView.builder(
                    itemCount: listTiles1.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles1[index],
                            catId: 1, position: index),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  // color: Colors.greenAccent,
                  child: ListView.builder(
                    itemCount: listTiles2.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {},
                          child: buildCard(listTiles2[index],
                              catId: 2, position: index));
                    },
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: listTiles3.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: buildCard(listTiles3[index],
                          catId: 3, position: index),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  child: ListView.builder(
                    itemCount: listTiles4.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles4[index],
                            catId: 4, position: index),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: listTiles5.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles5[index],
                            catId: 5, position: index),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.deepPurple,
            items: <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.add, size: 30),
              Icon(Icons.compare_arrows, size: 30),
            ],
            onTap: (index) {
              if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubmitNews()));
              }
              //Handle button tap
            },
          ),
          drawer: Drawer(
            elevation: 18,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                    accountName: Text((userName != null ? userName : 'abc'),
                        style: TextStyle(fontSize: 20)),
                    accountEmail: Text((userEmailAddress != null
                        ? userEmailAddress
                        : 'abc@gmail.com')),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/default-avatar.jpg",
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.red, Colors.deepPurple]))
                    // color: Colors.deepPurple
                    //   image: DecorationImage(
                    //     image: AssetImage(
                    //         "assets/road-wall paper.webp"),
                    //     fit: BoxFit.cover,
                    //   ),
                    ),
                ListTile(
                  leading: Icon(Icons.person, size: 25, color: Colors.blueGrey),
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyProfilePage2()),
                    );
                  },
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading:
                      Icon(Icons.favorite, size: 25, color: Colors.blueGrey),
                  title: const Text(
                    'Favourites',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favourite()));
                  },
                ),
                (userRole == 1)
                    ? Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ListTile(
                          leading: Icon(Icons.all_inbox,
                              size: 25, color: Colors.blueGrey),
                          title: const Text(
                            'All news',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllNewsPage()));
                          },
                        ),
                      )
                    : Container(),
                const SizedBox(height: 10),
                ListTile(
                  leading:
                      Icon(Icons.post_add, size: 25, color: Colors.blueGrey),
                  title: const Text(
                    'My news',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPost()));
                  },
                ),
                const SizedBox(height: 10),
                // Divider(color: Colors.black),
                // const SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.share, size: 25, color: Colors.blueGrey),
                  title: const Text(
                    'Share',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    MaterialPageRoute(builder: (context) => Share());
                  },
                ),
                const SizedBox(height: 10),
                // Divider(color: Colors.black),
                // const SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.info, size: 25, color: Colors.blueGrey),
                  title: const Text(
                    'About Us',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
                const SizedBox(height: 10),
                Divider(color: Colors.black),
                ListTile(
                  leading:
                      Icon(Icons.settings_power, size: 25, color: Colors.red),
                  title: const Text(
                    'Sign out',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    signOut();
                  },
                ),
              ],
            ),
          )),
    );
  }

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Myapp()));
  }

  getNewsCategory1() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=0',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles0 = resp.data['result'];
      Log.i('0_length', listTiles0.length.toString());
      print(listTiles0);

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

  getuserProfile() async {
    var response;
    try {
      response = await Dio().get(Configuration.serverUrl + "/user/profile",
          options: Options(headers: {
            'Authorization': ' Bearer ' + Configuration.authToken
          }));
      print(response);
    } catch (e, s) {
      print(e.toString() + s.toString());
    }
    try {
      if (response.data['status']) {
        userName = response.data['result'][0]['firstName'] +
            ' ' +
            response.data['result'][0]['lastName'];
        userEmailAddress = response.data['result'][0]['emailAddress'];
        userPhoneNumber = response.data['result'][0]['phoneNumber'];
        userRole = response.data['result'][0]['role'];
      }
    } catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    setState(() {});
  }

  getNewsCategory2() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=1',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles1 = resp.data['result'];
      Log.i('0_length', listTiles1.length.toString());
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

  getNewsCategory3() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=2',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles2 = resp.data['result'];
      Log.i('0_length', listTiles2.length.toString());
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

  getNewsCategory4() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=3',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles3 = resp.data['result'];
      Log.i('0_length', listTiles3.length.toString());
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

  getNewsCategory5() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=4',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles4 = resp.data['result'];
      Log.i('0_length', listTiles4.length.toString());
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

  getNewsCategory6() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=5',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles5 = resp.data['result'];
      Log.i('0_length', listTiles5.length.toString());
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

  newsLike(item, {int? catId, position}) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": item['_id'].toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/like',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
    try {
      Log.i('like_resp', resp.data);
      if (resp.data['status']) {
        switch (catId) {
          case 0:
            if (listTiles0[position]['liked']) {
              listTiles0[position]['like']--;
            } else {
              listTiles0[position]['like']++;
            }
            listTiles0[position]['liked'] = !listTiles0[position]['liked'];

            if (listTiles0[position]['disliked'] == null) {
            } else if (listTiles0[position]['disliked'] == true &&
                listTiles0[position]['liked'] == true) {
              listTiles0[position]['disliked'] = false;
              listTiles0[position]['dislike']--;
            } else {}
            break;
          case 1:
            if (listTiles1[position]['liked']) {
              listTiles1[position]['like']--;
            } else {
              listTiles1[position]['like']++;
            }
            listTiles1[position]['liked'] = !listTiles1[position]['liked'];

            if (listTiles1[position]['disliked'] == null) {
            } else if (listTiles1[position]['disliked'] == true &&
                listTiles1[position]['liked'] == true) {
              listTiles1[position]['disliked'] = false;
              listTiles1[position]['dislike']--;
            } else {}
            break;
          case 2:
            if (listTiles2[position]['liked']) {
              listTiles2[position]['like']--;
            } else {
              listTiles2[position]['like']++;
            }
            listTiles2[position]['liked'] = !listTiles2[position]['liked'];

            if (listTiles2[position]['disliked'] == null) {
            } else if (listTiles2[position]['disliked'] == true &&
                listTiles2[position]['liked'] == true) {
              listTiles2[position]['disliked'] = false;
              listTiles2[position]['dislike']--;
            } else {}
            break;
          case 3:
            if (listTiles3[position]['liked']) {
              listTiles3[position]['like']--;
            } else {
              listTiles3[position]['like']++;
            }
            listTiles3[position]['liked'] = !listTiles3[position]['liked'];

            if (listTiles3[position]['disliked'] == null) {
            } else if (listTiles3[position]['disliked'] == true &&
                listTiles3[position]['liked'] == true) {
              listTiles3[position]['disliked'] = false;
              listTiles3[position]['dislike']--;
            } else {}
            break;
          case 4:
            if (listTiles4[position]['liked']) {
              listTiles4[position]['like']--;
            } else {
              listTiles4[position]['like']++;
            }
            listTiles4[position]['liked'] = !listTiles4[position]['liked'];

            if (listTiles4[position]['disliked'] == null) {
            } else if (listTiles4[position]['disliked'] == true &&
                listTiles4[position]['liked'] == true) {
              listTiles4[position]['disliked'] = false;
              listTiles4[position]['dislike']--;
            } else {}
            break;
          case 5:
            if (listTiles5[position]['liked']) {
              listTiles5[position]['like']--;
            } else {
              listTiles5[position]['like']++;
            }
            listTiles5[position]['liked'] = !listTiles5[position]['liked'];

            if (listTiles5[position]['disliked'] == null) {
            } else if (listTiles5[position]['disliked'] == true &&
                listTiles5[position]['liked'] == true) {
              listTiles5[position]['disliked'] = false;
              listTiles5[position]['dislike']--;
            } else {}
            break;
          default:
            break;
        }
      }
    } catch (e, s) {
      Log.e(e, s);
    }
    setState(() {});
  }

  newsDislike(item, {int? catId, position}) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": item['_id'].toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/dislike',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
    try {
      Log.i('dislike_response', resp.data);
      if (resp.data['status']) {
        switch (catId) {
          case 0:
            if (listTiles0[position]['disliked']) {
              listTiles0[position]['dislike']--;
            } else {
              listTiles0[position]['dislike']++;
            }
            listTiles0[position]['disliked'] =
                !listTiles0[position]['disliked'];

            if (listTiles0[position]['liked'] == null) {
            } else if (listTiles0[position]['liked'] == true &&
                listTiles0[position]['disliked'] == true) {
              listTiles0[position]['liked'] = false;
              listTiles0[position]['like']--;
            } else {}
            break;
          case 1:
            if (listTiles1[position]['disliked']) {
              listTiles1[position]['dislike']--;
            } else {
              listTiles1[position]['dislike']++;
            }
            listTiles1[position]['disliked'] =
            !listTiles1[position]['disliked'];

            if (listTiles1[position]['liked'] == null) {
            } else if (listTiles1[position]['liked'] == true &&
                listTiles1[position]['disliked'] == true) {
              listTiles1[position]['liked'] = false;
              listTiles1[position]['like']--;
            } else {}
            break;
          case 2:
            if (listTiles2[position]['disliked']) {
              listTiles2[position]['dislike']--;
            } else {
              listTiles2[position]['dislike']++;
            }
            listTiles2[position]['disliked'] =
            !listTiles2[position]['disliked'];

            if (listTiles2[position]['liked'] == null) {
            } else if (listTiles2[position]['liked'] == true &&
                listTiles2[position]['disliked'] == true) {
              listTiles2[position]['liked'] = false;
              listTiles2[position]['like']--;
            } else {}
            break;
          case 3:
            if (listTiles3[position]['disliked']) {
              listTiles3[position]['dislike']--;
            } else {
              listTiles3[position]['dislike']++;
            }
            listTiles3[position]['disliked'] =
            !listTiles3[position]['disliked'];

            if (listTiles3[position]['liked'] == null) {
            } else if (listTiles3[position]['liked'] == true &&
                listTiles3[position]['disliked'] == true) {
              listTiles3[position]['liked'] = false;
              listTiles3[position]['like']--;
            } else {}
            break;
          case 4:
            if (listTiles4[position]['disliked']) {
              listTiles4[position]['dislike']--;
            } else {
              listTiles4[position]['dislike']++;
            }
            listTiles4[position]['disliked'] =
            !listTiles4[position]['disliked'];

            if (listTiles4[position]['liked'] == null) {
            } else if (listTiles4[position]['liked'] == true &&
                listTiles4[position]['disliked'] == true) {
              listTiles4[position]['liked'] = false;
              listTiles4[position]['like']--;
            } else {}
            break;
          case 5:
            if (listTiles5[position]['disliked']) {
              listTiles5[position]['dislike']--;
            } else {
              listTiles5[position]['dislike']++;
            }
            listTiles5[position]['disliked'] =
            !listTiles5[position]['disliked'];

            if (listTiles5[position]['liked'] == null) {
            } else if (listTiles5[position]['liked'] == true &&
                listTiles5[position]['disliked'] == true) {
              listTiles5[position]['liked'] = false;
              listTiles5[position]['like']--;
            } else {}
            break;

          default:
            break;
        }
      }
    } catch (e, s) {
      Log.e(e, s);
    }
    setState(() {});
  }

  newsFav(item, {int? catId, position}) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": item['_id'].toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/favourites',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
    try {
      if (resp.data['status']) {
        var newsTab="listTiles"+catId.toString();
        switch (catId) {
          case 0:
            listTiles0[position]['fav_user'] =
                !listTiles0[position]['fav_user'];

            break;
          case 1:
            listTiles1[position]['fav_user'] =
                !listTiles1[position]['fav_user'];

            break;
          case 2:
            listTiles2[position]['fav_user'] =
                !listTiles2[position]['fav_user'];

            break;
          case 3:
            listTiles3[position]['fav_user'] =
                !listTiles3[position]['fav_user'];

            break;
          case 4:
            listTiles4[position]['fav_user'] =
                !listTiles4[position]['fav_user'];

            break;
          case 5:
            listTiles5[position]['fav_user'] =
                !listTiles5[position]['fav_user'];

            break;

            // if (listTiles0[position]['fav_user'] == true  ){
            //   listTiles0[position]['fav_user'] = false;
            //
            // } else {
            //
            // }
            break;
          default:
            break;
        }
      }
    } catch (e, s) {}
    setState(() {});
  }

  Widget buildCard(item, {catId, position}) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item!['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    // fontStyle: FontStyle.italic,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Published On : \t',
                      style: TextStyle(
                          fontSize: 12, color:Colors.black),
                    ),
                    Text(
                      TimeUtil.convertTimeStamp(item!['createdAt']),
                      style: TextStyle(
                          fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.deepPurple,
                  indent: 10,
                  endIndent: 10,
                ),
                // const SizedBox(height: 5),
                // Padding(
                // padding: EdgeInsets.fromLTRB(15, 5, 10, 10),
                // child: Text(
                //   item!['description'],
                //   style: TextStyle(
                //     fontSize: 16,
                //     decorationStyle: TextDecorationStyle.double,
                //   ),
                // ),
                // ),
                (item!['imageUrl'] != null)
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullView(newDetails: item),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(_context!).size.width,
                          height: MediaQuery.of(_context!).size.width / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item!['imageUrl']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )
                    : Container(),
                Divider(
                  color: Colors.deepPurple,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                    //   bottom: 0,
                    //   top: 0,
                    //   right: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Likers()));
                        },
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.thumb_up_outlined,
                              ),
                              color: (item!['liked'] == true)
                                  ? Configuration.favIconColor1 =
                                      Colors.deepPurple
                                  : Configuration.favIconColor1 = Colors.grey,
                              onPressed: () async {
                                newsLike(item,
                                    catId: catId, position: position);
                              },
                            ),
                            (item!['like'] > 0)
                                ? Text(item!['like'].toString())
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dislikers()));
                            },
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    (item!['disliked'] == true)
                                        ? Icons.thumb_down
                                        : Icons.thumb_down_outlined,
                                  ),
                                  color: (item!['disliked'] == true)
                                      ? Configuration.favIconColor1 = Colors.red
                                      : Configuration.favIconColor1 =
                                          Colors.grey,
                                  onPressed: () async {
                                    newsDislike(item,
                                        catId: catId, position: position);
                                  },
                                ),
                                (item!['dislike'] > 0)
                                    ? Text(item!['dislike'].toString())
                                    : Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommentPage(
                                        newsId: item!['_id'],
                                      )));
                        },
                        icon: Icon(
                          Icons.comment_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              ((item!['fav_user'] == true))
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            color: (item!['fav_user'] == true)
                                ? Configuration.favIconColor3 = Colors.pink
                                : Configuration.favIconColor3 = Colors.grey,
                            onPressed: () async {
                              newsFav(item, catId: catId, position: position);
                            },
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          validate();
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.deepPurple,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 20, top: 10),
                  child: Text(
                    'Click to see more details.',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                )
              ]),
        ));
  }

  validate() async {
    ToastUtil.info(
      _context!,
      message: "This feature will come soon",
    );
    return;
  }
}
