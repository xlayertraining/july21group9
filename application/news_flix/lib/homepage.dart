import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Loginpg.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  class _HomePageState extends State<HomePage>
  with SingleTickerProviderStateMixin{
    List<Tab> tablist = [
      Tab(child: Text("LATEST NEWS"),),
  Tab(child: Text("NATIONAL NEWS"),),
  Tab(child: Text("INTERNATIONAL NEWS"),),
  Tab(child: Text("SPORTS"),),
  Tab(child: Text("TECH"),),
  Tab(child: Text("HEALTH"),),
    ];
  TabController tabController;
  @override
  void initState() {

  }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "NEWS FLIX",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          )),
      body: TabBarView(
      controller: TabController,
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
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
    );
  }
}
