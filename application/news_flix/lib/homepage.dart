import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ListWidget.dart';

import 'AboutUs.dart';
import 'Favourite.dart';
import 'Loginpg.dart';
import 'MyPost.dart';
import 'SearchPage.dart';
import 'Share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get listTiles1 => [
        {
          "newsTitle": 'Anime Planet',
          'author': 'Rahul',
          'date': '6hr ago',
          'imageUrl':
              'https://cdn.neow.in/news/images/uploaded/2019/06/1561493403_one_punch_man.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'Headlines Tripura ',
          'author': 'Aniket Lodh',
          'date': '5hr ago',
          'imageUrl':
              'https://thelogicalindian.com/h-upload/2020/07/21/177535-tripurafb.jpg',
          "liked": false,
        },
        {
          "newsTitle": 'India Today',
          'author': 'Samyadeep ',
          'date': '3rd August',
          'imageUrl':
              'https://s3images.zee5.com/wp-content/uploads/sites/7/2021/08/india-vs-england-784x441.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'BBC News',
          'author': 'Nabanit Roy',
          'date': '2rd August',
          'imageUrl':
              'https://www.mtbs3d.com/gallery/albums/userpics/10002/bbcnews_logo.jpg',
          "liked": false,
        }
      ];
  get listTiles2 => [
        {
          "newsTitle": 'Zee News ',
          'author': 'Nabanit Roy',
          'date': '6th August ',
          'imageUrl':
              'https://i.kym-cdn.com/photos/images/newsfeed/000/775/726/e40.jpg'
        },
        {
          "newsTitle": 'Ajj Tak ',
          'author': 'Basabjit',
          'date': '5th August',
          'imageUrl':
              'https://d2c7ipcroan06u.cloudfront.net/wp-content/uploads/2019/05/2019.jpg'
        },
        {
          "newsTitle": 'India Today',
          'author': 'Samyadeep ',
          'date': '3rd August',
          'imageUrl': 'https://www.epapersland.com/images/dailynews.jpg'
        },
        {
          "newsTitle": 'Asia Today',
          'author': 'Aniket ',
          'date': '3rd August',
          'imageUrl': 'https://images.indianexpress.com/2014/01/thumb119.jpg'
        },
        {
          "newsTitle": 'Daily Planet',
          'author': 'Rahul ',
          'date': '6th August',
          'imageUrl':
              'https://dominicanewsonline.com/news/wp-content/uploads/2020/07/budget.jpg'
        },
      ];
  get listTiles3 => [
        {
          "newsTitle": 'World News ',
          'author': 'Nabanit Roy',
          'date': '6hr ago',
          'imageUrl':
              'https://www.foxnewsinternational.com/img/marquee-specialreport.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'London Times ',
          'author': 'Basabjit',
          'date': '5hr ago',
          'imageUrl':
              'https://simplycareer.com/wp-content/uploads/2015/04/international-affairs-jobs-1024x512.jpg'
        },
        {
          "newsTitle": 'BBC',
          'author': 'Samyadeep ',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.pngfacts.com/uploads/1/1/3/2/11320972/fire-australia_orig.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'author': 'Aniket ',
          'date': '3hr ago',
          'imageUrl':
              'https://cdn.pixabay.com/photo/2015/12/03/10/12/news-1074604_640.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'Daily Planet',
          'author': 'Ankit ',
          'date': '3rd August ',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/Mental-Health-Awareness-Week-2021-theme.jpg'
        },
      ];
  get listTiles4 => [
        {
          "newsTitle": 'World News ',
          'author': 'Nabanit',
          'date': '6th August 2021',
          'imageUrl':
              'http://static.dnaindia.com/sites/default/files/2018/04/14/671873-neeraj-chopra-gold-afp.jpg'
        },
        {
          "newsTitle": 'London Times ',
          'author': 'Basabjit',
          'date': '5th August 2021',
          'imageUrl':
              'https://www.thesportsgeek.com/wp-content/uploads/2020/06/2021-Olympic-Logo-825x400.jpg'
        },
        {
          "newsTitle": 'India Today',
          'author': 'Samyadeep',
          'date': '3rd August 2021',
          'imageUrl':
              'https://s3images.zee5.com/wp-content/uploads/sites/7/2021/08/india-vs-england-784x441.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'author': 'Aniket',
          'date': '3rd August 2021',
          'imageUrl':
              'https://i.pinimg.com/originals/55/55/9c/55559cfe50a9870c3ea7dd034f0997e5.jpg'
        },
        {
          "newsTitle": 'Sports News',
          'author': 'Samyadeep',
          'date': '3rd August 2021',
          'imageUrl':
              'https://dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/1363/2020/04/10080746/trials-opening-currie-885x544-1.jpg'
        },
      ];
  get listTiles5 => [
        {
          "newsTitle": 'World News ',
          'author': 'Nabanit',
          'date': '6th August 2021',
          'imageUrl':
              'https://www.e-zigurat.com/news/wp-content/uploads/sites/3/2021/03/news_agorbaim_es1.jpg'
        },
        {
          "newsTitle": 'London Times ',
          'author': 'Basabjit',
          'date': '5th August 2021',
          'imageUrl':
              'https://schoolofmusic.ucla.edu/app/uploads/2019/04/Final-AMOLA.png'
        },
        {
          "newsTitle": 'BBC',
          'author': 'Samyadeep',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.e-zigurat.com/news/wp-content/uploads/sites/3/2021/01/ited_news_1.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'author': 'Aniket',
          'date': '3rd August 2021',
          'imageUrl':
              'https://images.template.net/wp-content/uploads/2019/04/Metalogic-%E2%80%93-Responsive-WordPress-Theme.jpeg'
        },
        {
          "newsTitle": 'India Today',
          'author': 'Sam ',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/Mental-Health-Awareness-Week-2021-theme.jpg'
        },
      ];
  get listTiles6 => [
        {
          "newsTitle": 'World News ',
          'author': 'Nabanit',
          'date': '6th August 2021',
          'imageUrl':
              'https://thumbs.dreamstime.com/b/year-coronavirus-illustration-particles-181596054.jpg'
        },
        {
          "newsTitle": 'London Times ',
          'author': 'Basabjit',
          'date': '5th August 2021',
          'imageUrl':
              'https://i.ebayimg.com/images/g/N04AAOSwNXlfBg~2/s-l400.jpg'
        },
        {
          "newsTitle": 'BBC',
          'author': 'Samyadeep',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/MHAW-2021-Hold-Twitter-Image.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'author': 'Ankit',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/Mental-Health-Awareness-Week-2021-theme.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'author': 'Ankit ',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.tentaran.com/wp-content/uploads/2021/01/latest-india-business-news-today-23-january-2021.jpg'
        },
      ];
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarOpacity: 0.5,
          toolbarHeight: 120,
          title: Text(
            "NEWS FLIX",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.cyan.shade100, Colors.blue.shade400]))),
          actions: [
            IconButton(
              color: Colors.black,
              iconSize: 28,
              splashRadius: 10,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            // SizedBox(
            //   width: 10,
            // ),
            // Container(
            //   width: 50,
            //   child: Image.asset("assets/news.png"
            //   ),
            //     height: 200,
            //   ),
          ],

          bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              tabs: [
                Tab(
                  child: Text("Latest"),
                ),
                Tab(
                  child: Text("National"),
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
                  child: ListWidget(listTiles1[index]),
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
                      child: ListWidget(listTiles2[index]),
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
                      child: ListWidget(listTiles3[index]),
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
                    child: ListWidget(listTiles4[index]),
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
                      child: ListWidget(listTiles5[index]),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                color: Colors.greenAccent,
                child: ListView.builder(
                  itemCount: listTiles6.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ListWidget(listTiles6[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: _currentIndex,
        //
        //     items: [
        //       BottomNavigationBarItem(
        //         icon:Icon(Icons.home),
        //         label: "Home",
        //         backgroundColor: Colors.redAccent,
        //       ),
        //       BottomNavigationBarItem(
        //         icon:Icon(Icons.search),
        //         label: "Search",
        //         backgroundColor: Colors.indigoAccent,
        //       ),
        //
        //       BottomNavigationBarItem(
        //         icon:Icon(Icons.notifications),
        //         label: "Notification",
        //         backgroundColor: Colors.yellowAccent,
        //       ),
        //       BottomNavigationBarItem(
        //         icon:Icon(Icons.person),
        //         label: "Person",
        //         backgroundColor: Colors.blueAccent,
        //       ),
        //     ],
        //     onTap: (index){
        //       setState(() {
        //         _currentIndex = index;
        //       });
        //     }
        // ),

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
                leading:
                    Icon(Icons.favorite, color: Colors.pinkAccent.shade100),
                title: const Text('Favourites'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favourite()));
                },
              ),
              const SizedBox(height: 15),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.post_add, color: Colors.blue),
                title: const Text('My Post'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPost()));
                },
              ),
              const SizedBox(height: 15),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.bookmarks, color: Colors.lightBlueAccent),
                title: const Text('bookmark'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Share()));
                },
              ),

              const SizedBox(height: 10),
              Divider(color: Colors.black),
              const SizedBox(height: 10),
              // ListTile(
              //   leading: Icon(Icons.notifications,color:Colors.red.shade600 ),
              //   title: const Text('Notification'),
              //   onTap: () {},
              //   trailing: ClipOval(
              //     child:Container(
              //       color: Colors.red,
              //       width: 20,
              //       height: 20,
              //       child:Center(
              //         child: Text(
              //           '6',style: TextStyle(color: Colors.white,
              //             fontSize:12 ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              ListTile(
                leading: Icon(Icons.description),
                title: const Text('About us'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.black),
              const SizedBox(height: 10),

              ListTile(
                leading: Icon(Icons.settings_power, color: Colors.red),
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
