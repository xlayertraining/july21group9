import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/list_widget.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'about_us.dart';
import 'comment_page.dart';
import 'create_post.dart';
import 'dislikers.dart';
import 'favourite_page.dart';
import 'full_view.dart';
import 'likers.dart';
import 'Profile2.dart';

import 'sign_in_page.dart';
import 'my_post.dart';
import 'search_page.dart';
import 'Share.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listTiles1 = [];
  var listTiles2 = [];
  var listTiles3 = [];
  var listTiles4 = [];
  var listTiles5 = [];
  var listTiles6 = [];
  BuildContext? _context;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
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
                  Icons.notifications_active,
                  color: Colors.redAccent.shade400,
                ),
                onPressed: () {
                  // do something
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.redAccent.shade400,
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
                itemCount: listTiles1.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: buildCard(listTiles1[index]),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  // color: Colors.lightBlueAccent,
                  child: ListView.builder(
                    itemCount: listTiles2.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles2[index]),
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
                    itemCount: listTiles3.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles3[index]),
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: listTiles4.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: buildCard(listTiles4[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  child: ListView.builder(
                    itemCount: listTiles5.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles5[index]),
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
                    itemCount: listTiles6.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: buildCard(listTiles6[index]),
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
                    MaterialPageRoute(builder: (context) => AppImagePicker()));
              }
              //Handle button tap
            },
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              // Important: Remove any padding from the ListView.
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Samyadeep'),
                  accountEmail: Text('sahasamyadeep@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        'https://images.wallpapersden.com/image/download/itachi-uchiha-anime_a2xuZmiUmZqaraWkpJRnbmhnrWduaGc.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://wallpaperaccess.com/full/22250.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                  leading: Icon(Icons.favorite, size: 25, color: Colors.blueGrey),
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
                const SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.post_add, size: 25, color: Colors.blueGrey),
                  title: const Text(
                    'My Post',
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
                    'About us',
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
                const SizedBox(height: 120),
                Divider(color: Colors.black),
                // const SizedBox(height: 10),

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
      listTiles1 = resp.data['result'];
      Log.i('0_length', listTiles1.length.toString());
      print(listTiles1);
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

  getNewsCategory2() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=1',
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

  getNewsCategory3() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=2',
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

  getNewsCategory4() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=3',
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

  getNewsCategory5() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=4',
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

  getNewsCategory6() async {
    Response? resp = null;
    resp = await Dio().get(Configuration.serverUrl + '/news?category=5',
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      listTiles6 = resp.data['result'];
      Log.i('0_length', listTiles6.length.toString());
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

  newsLike(var id) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": id.toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/like',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
  }

  newsDislike(var id) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": id.toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/dislike',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
  }

  newsFav(var id) async {
    Response? resp = null;
    var newsIdData = FormData.fromMap({"newsId": id.toString()});
    resp = await Dio().post(
      Configuration.serverUrl + '/news/favourites',
      data: newsIdData,
      options: Options(
          headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
    );
  }

  Widget buildCard(var item) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
                    child: Text(
                      item!['title'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                        // fontStyle: FontStyle.italic,
                        decorationStyle: TextDecorationStyle.double,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
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
                  ? Container(
                      width: MediaQuery.of(_context!).size.width,
                      height: MediaQuery.of(_context!).size.width / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item!['imageUrl']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(3),
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
                  children: [
                    InkWell(
                      onLongPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Likers()));
                      },
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up_outlined,
                            ),
                            color: (liked==true)?Configuration.favIconColor1=Colors.deepPurple:  Configuration.favIconColor1 = Colors.grey,
                            onPressed: () async {
                              var likes = item['_id'];
                              newsLike(likes);
                              setState(() {
                                if (Configuration.favIconColor1 ==
                                    Colors.grey) {
                                  Configuration.favIconColor1 =
                                      Colors.deepPurple;
                                  liked=true;
                                  Configuration.favIconColor2 = Colors.grey;
                                } else {
                                  Configuration.favIconColor1 = Colors.grey;
                                  liked = false;
                                }
                              });
                            },
                          ),
                          (item!['like'] > 0)
                              ? Text(item!['like'].toString())
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dislikers()));
                      },
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down_outlined,
                            ),
                            color: Configuration.favIconColor2,
                            onPressed: () async {
                              var dislikes = item!['_id'];
                              newsDislike(dislikes);
                              setState(() {
                                if (Configuration.favIconColor2 ==
                                    Colors.grey) {
                                  Configuration.favIconColor2 = Colors.red;
                                  Configuration.favIconColor1 = Colors.grey;
                                } else {
                                  Configuration.favIconColor2 = Colors.grey;
                                }
                              });
                            },
                          ),
                          (item!['dislike'] > 0)
                              ? Text(item!['dislike'].toString())
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentPage()));
                      },
                      icon: Icon(
                        Icons.comment_outlined,
                        color:
                            (item!['liked'] == null || item!['liked'] == false)
                                ? Colors.grey
                                : Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        child: Column(
                      children: [
                        IconButton(

                          icon: Icon(
                            Icons.favorite,
                          ),
                          color: (item!['fav_user']==true)?Configuration.favIconColor3=Colors.pink:  Configuration.favIconColor3 = Colors.grey,
                          onPressed: () async {
                            var favId = item!['_id'];
                            newsFav(favId);
                            setState(() {
                              if (Configuration.favIconColor3 == Colors.grey) {
                                Configuration.favIconColor3 = Colors.pink;
                              } else {
                                Configuration.favIconColor3 = Colors.grey;
                              }
                            });
                          },
                        ),

                      ],
                    )
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
                padding: EdgeInsets.only(left: 10, bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text('View full news'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FullView()),
                    );
                  },
                ),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              // Expanded(
              //     child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //       Text(
              //         item['newsTitle'],
              //         style:
              //             TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         children: [
              //           Icon(
              //             Icons.date_range,
              //             color: Colors.greenAccent,
              //           ),
              //           Text(
              //             item['date'],
              //             style: TextStyle(
              //               fontSize: 12,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Icon(Icons.favorite_sharp,
              //               color: Colors.redAccent, size: 20),
              //           SizedBox(
              //             width: 30,
              //           ),
              //           Icon(Icons.comment_outlined,
              //               color: Colors.blue, size: 20),
              //           SizedBox(
              //             width: 30,
              //           ),
              //           Icon(
              //             Icons.share,
              //             color: Colors.pinkAccent,
              //             size: 20,
              //           ),
              //         ],
              //       )
              //         ]
              //     )
              // ),
            ]));
  }
}
