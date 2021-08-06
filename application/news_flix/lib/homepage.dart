import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ListWidget.dart';

import 'Loginpg.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  get listTiles => [
    {
      "newsTitle": 'Tripura News',
      'author': 'Rahul Dravid',
      'date': '6th August 2021',
      'imageUrl': 'https://www.wallpaperuse.com/wallp/49-493522_m.jpg'
    },
    {
      "newsTitle": 'Headlines Tripura ',
      'author': 'Aniket Lodh',
      'date': '5th August 2021',
      'imageUrl': 'https://votoart.com/upload/t44f7a2a5-1385-11e4-bc57-003048cab8f4.jpg'
    },
    {
      "newsTitle": 'India Today',
      'author': 'Samyadeep Saha',
      'date': '3rd August 2021',
      'imageUrl': 'https://votoart.com/upload/t44f7a2a5-1385-11e4-bc57-003048cab8f4.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    textStyle() {
      return TextStyle(color: Colors.white, fontSize: 30.0);
    }
    return new DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          title:Text("NEWS FLIX",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,),
          ),
          backgroundColor: Colors.redAccent,
          bottom:TabBar(
              isScrollable: true,
              indicatorWeight: 3.0 ,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.symmetric(horizontal: 15),

              tabs: [
                Tab(
                  child:Text("Latest"),
                ),
                Tab(
                  child:Text ("National"),),
                Tab(
                  child:Text ("International"),),
                Tab(child:Text ("Sports"),),
                Tab(child:Text ("Tech"),),
                Tab(
                  child:Text ("Business"),
                ),
              ]
          ),
        ),
        body:TabBarView(
          children: <Widget>[
            Container(
              color: Colors.deepOrangeAccent,
            ),
            Padding(padding: EdgeInsets.all(8),
              child: Container(
                child: ListView.builder(
                  itemCount: listTiles.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){},
                      child: ListWidget(listTiles[index]),
                    );
                  },
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
            // Container(
            //   color: Colors.tealAccent,
            //   child:Center(
            //     child:Text(
            //       "Business",
            //       style: textStyle(),
            //     ),
            //   ),
            // ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,

            items: [
              BottomNavigationBarItem(
                icon:Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.redAccent,
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
    );

  }
}

