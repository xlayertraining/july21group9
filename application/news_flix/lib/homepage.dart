import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Loginpg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "NEWS FLIX",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.redAccent,
              elevation: 0,
              bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white
                ),
                tabs: [
                  Tab(
                    child: Container(

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Latest",
                          style: TextStyle(color: Colors.yellowAccent),),

                      ),
                    ),
                  ),
                  Tab(
                    child: Container(

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("National",
                          style: TextStyle(color: Colors.yellowAccent),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("International",
                          style: TextStyle(color: Colors.yellowAccent),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Sports",
                          style: TextStyle(color: Colors.yellowAccent),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Tech",
                          style: TextStyle(color: Colors.yellowAccent),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Health",
                          style: TextStyle(color: Colors.yellowAccent),),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            body: TabBarView(

              children: [
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView(

                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
                ),
              ],
            ),

            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.

                children: [

                  UserAccountsDrawerHeader(
                    accountName: Text('Samyadeep'),
                    accountEmail: Text('sahasamyadeep@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child:
                        Image.asset("assets/boy.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.wallpaperuse.com/vien/TbiJmm/"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),


                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: const Text('Favourites'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: const Text('Share'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: const Text('About us'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_power),
                    title: const Text('Sign out'),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Myapp()));
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                    },
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.black),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: const Text('Notification'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: const Text('Search'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
