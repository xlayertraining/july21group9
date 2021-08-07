import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ListWidget.dart';

import 'AboutUs.dart';
import 'Favourite.dart';
import 'Loginpg.dart';
import 'Settings.dart';
import 'Share.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  get listTiles1 => [
    {
      "newsTitle": 'Anime Planet',
      'author': 'Rahul Dravid',
      'date': '6th August 2021',
      'imageUrl': 'https://cdn.neow.in/news/images/uploaded/2019/06/1561493403_one_punch_man.jpg'
    },
    {
      "newsTitle": 'Headlines Tripura ',
      'author': 'Aniket Lodh',
      'date': '5th August 2021',
      'imageUrl': 'https://thelogicalindian.com/h-upload/2020/07/21/177535-tripurafb.jpg'
    },
    {
      "newsTitle": 'India Today',
      'author': 'Samyadeep Saha',
      'date': '3rd August 2021',
      'imageUrl': 'https://s3images.zee5.com/wp-content/uploads/sites/7/2021/08/india-vs-england-784x441.jpg'
    },
    {
      "newsTitle": 'BBC News',
      'author': 'Nabanit Roy',
      'date': '2rd August 2021',
      'imageUrl': 'https://www.mtbs3d.com/gallery/albums/userpics/10002/bbcnews_logo.jpg'
    },
  ];
  get listTiles2 => [
    {
      "newsTitle": 'Zee News ',
      'author': 'Nabanit Roy',
      'date': '6th August 2021',
      'imageUrl': 'https://i.kym-cdn.com/photos/images/newsfeed/000/775/726/e40.jpg'
    },
    {
      "newsTitle": 'Ajj Tak ',
      'author': 'Basabjit S.Roy',
      'date': '5th August 2021',
      'imageUrl': 'https://d2c7ipcroan06u.cloudfront.net/wp-content/uploads/2019/05/2019.jpg'
    },
    {
      "newsTitle": 'India Today',
      'author': 'Samyadeep Saha',
      'date': '3rd August 2021',
      'imageUrl': 'https://www.epapersland.com/images/dailynews.jpg'
    },
    {
      "newsTitle": 'Asia Today',
      'author': 'Aniket Lodh',
      'date': '3rd August 2021',
      'imageUrl': 'https://images.indianexpress.com/2014/01/thumb119.jpg'
    },
  ];
  get listTiles3 => [
    {
      "newsTitle": 'World News ',
      'author': 'Nabanit Roy',
      'date': '6th August 2021',
      'imageUrl': 'https://www.foxnewsinternational.com/img/marquee-specialreport.jpg'
    },
    {
      "newsTitle": 'London Times ',
      'author': 'Basabjit S.Roy',
      'date': '5th August 2021',
      'imageUrl': 'https://simplycareer.com/wp-content/uploads/2015/04/international-affairs-jobs-1024x512.jpg'
    },
    {
      "newsTitle": 'BBC',
      'author': 'Samyadeep Saha',
      'date': '3rd August 2021',
      'imageUrl': 'https://www.pngfacts.com/uploads/1/1/3/2/11320972/fire-australia_orig.jpg'
    },
    {
      "newsTitle": 'Newyork Times',
      'author': 'Aniket Lodh',
      'date': '3rd August 2021',
      'imageUrl': 'https://cdn.pixabay.com/photo/2015/12/03/10/12/news-1074604_640.jpg'
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
            Padding(padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.pinkAccent.shade100,
                child: ListView.builder(
                  itemCount: listTiles1.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){},
                      child: ListWidget(listTiles1[index]),
                    );
                  },
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.lightBlueAccent,
                child: ListView.builder(
                  itemCount: listTiles2.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){},
                      child: ListWidget(listTiles2[index]),
                    );
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.greenAccent,
                child: ListView.builder(
                  itemCount: listTiles3.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){},
                      child: ListWidget(listTiles3[index]),
                    );
                  },
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
            padding: EdgeInsets.zero,
            // Important: Remove any padding from the ListView.
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Samyadeep'),
                accountEmail: Text('sahasamyadeep@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child:
                    Image.network(
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
                        "https://wallpaperaccess.com/full/22250.jpg"
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

              const SizedBox(height: 10),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.notifications,color:Colors.red.shade600 ),
                title: const Text('Notification'),
                onTap: () {},
                trailing: ClipOval(
                child:Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child:Center(
                  child: Text(
                    '6',style: TextStyle(color: Colors.white,
                  fontSize:12 ),
                  ),
                  ),
                ),
              ),
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
            ],
          ),
        ),
      ),
    );

  }
}


