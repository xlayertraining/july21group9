import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Favourite.dart';
import 'package:untitled2/Settings.dart';
import 'package:untitled2/Share.dart';

import 'AboutUs.dart';
import 'Loginpg.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    textStyle() {
      return TextStyle(color: Colors.white, fontSize: 30.0);
    }
    return new DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title:Text("NEWS FLIX",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,),
          ),
          backgroundColor: Colors.redAccent.shade400,
          bottom:TabBar(
            isScrollable: true,
            indicatorWeight: 3.0 ,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.symmetric(horizontal: 15),
            tabs: [
              Tab(text: ("Latest"),),
              Tab(text: ("National"),),
              Tab(text: ("International"),),
              Tab(text: ("Sports"),),
              Tab(text: ("Tech"),),
              Tab(text: ("Business"),),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            Container(
              color: Colors.deepOrangeAccent,
              child:Center(
                child:Text(
                  "Latest",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child:Center(
                child:Text(
                  "National",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child:Center(
                child:Text(
                  "International",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child:Center(
                child:Text(
                  "Sports",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child:Center(
                child:Text(
                  "Tech",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.tealAccent,
              child:Center(
                child:Text(
                  "Business",
                  style: textStyle(),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,

            items: [
              BottomNavigationBarItem(
                icon:Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.redAccent.shade400,
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.search),
                label: "Search",
                backgroundColor: Colors.indigoAccent,
              ),

              BottomNavigationBarItem(
                icon:Icon(Icons.notifications),
                label: "Notification",
                backgroundColor: Colors.yellowAccent,
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.person),
                label: "Person",
                backgroundColor: Colors.blueAccent,
              ),
            ],
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            }
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
                  color: Colors.pink.shade900,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.wallpaperuse.com/vien/TbiJmm/"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              ListTile(
                leading: Icon(Icons.favorite,color:Colors.pinkAccent.shade100),
                title: const Text('Favourites'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favourite())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.share,color:Colors.lightBlueAccent),
                title: const Text('Share'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Share())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color:Colors.black ),
                title: const Text('Settings'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: const Text('About us'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_power,
                  color:Colors.red ),
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
                leading: Icon(Icons.notifications,color:Colors.red.shade600 ),
                title: const Text('Notification'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.search,color:Colors.blue.shade600 ),
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
    );

  }
}

