import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/ListWidget.dart';

import 'AboutUs.dart';
import 'Favourite.dart';
import 'Profile2.dart';
import 'ProfilePage.dart';
import 'sign_in_page.dart';
import 'MyPost.dart';
import 'SearchPage.dart';
import 'Share.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get listTiles1 => [
        {
          "newsTitle": 'Anime Planet',
          'date': '6hr ago',
          'newsSubtitle':
              'One punch Man Season 3 does not have any release date yet.',
          'imageUrl':
              'https://cdn.neow.in/news/images/uploaded/2019/06/1561493403_one_punch_man.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'Headlines Tripura ',
          'newsSubtitle':
              'One punch Man Season 3 does not have any release date yet.',
          'date': '5hr ago',
          'imageUrl':
              'https://thelogicalindian.com/h-upload/2020/07/21/177535-tripurafb.jpg',
          "liked": false,
        },
        {
          "newsTitle": 'India Today',
          'newsSubtitle':
              'One punch Man Season 3 does not have any release date yet.',
          'date': '3rd August',
          'imageUrl':
              'https://s3images.zee5.com/wp-content/uploads/sites/7/2021/08/india-vs-england-784x441.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'BBC News',
          'newsSubtitle':
              'One punch Man Season 3 doesnot have any release date yet.',
          'date': '2rd August',
          'imageUrl':
              'https://www.mtbs3d.com/gallery/albums/userpics/10002/bbcnews_logo.jpg',
          "liked": false,
        }
      ];
  get listTiles2 => [
        {
          "newsTitle": 'Zee News ',
          'newsSubtitle': 'Indian new Education Bill is ready.',
          'date': '6th August ',
          'imageUrl':
              'https://i.kym-cdn.com/photos/images/newsfeed/000/775/726/e40.jpg'
        },
        {
          "newsTitle": 'Ajj Tak ',
          'newsSubtitle': 'Indian new Education Bill is ready.',
          'date': '5th August',
          'imageUrl':
              'https://d2c7ipcroan06u.cloudfront.net/wp-content/uploads/2019/05/2019.jpg'
        },
        {
          "newsTitle": 'India Today',
          'newsSubtitle': 'Indian new Education Bill is ready.',
          'date': '3rd August',
          'imageUrl': 'https://www.epapersland.com/images/dailynews.jpg'
        },
        {
          "newsTitle": 'Asia Today',
          'newsSubtitle': 'Indian new Education Bill is ready.',
          'date': '3rd August',
          'imageUrl': 'https://images.indianexpress.com/2014/01/thumb119.jpg'
        },
        {
          "newsTitle": 'Daily Planet',
          'newsSubtitle': 'Indian new Education Bill is ready.',
          'date': '6th August',
          'imageUrl':
              'https://dominicanewsonline.com/news/wp-content/uploads/2020/07/budget.jpg'
        },
      ];
  get listTiles3 => [
        {
          "newsTitle": 'World News ',
          'newsSubtitle':
              'The world is still under the terror of new covid wave.',
          'date': '6hr ago',
          'imageUrl':
              'https://www.foxnewsinternational.com/img/marquee-specialreport.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'London Times ',
          'newsSubtitle':
              'The world is still under the terror of new covid wave.',
          'date': '5hr ago',
          'imageUrl':
              'https://simplycareer.com/wp-content/uploads/2015/04/international-affairs-jobs-1024x512.jpg'
        },
        {
          "newsTitle": 'BBC',
          'newsSubtitle':
              'The world is still under the terror of new covid wave.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.pngfacts.com/uploads/1/1/3/2/11320972/fire-australia_orig.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'newsSubtitle':
              'The world is still under the terror of new covid wave.',
          'date': '3hr ago',
          'imageUrl':
              'https://cdn.pixabay.com/photo/2015/12/03/10/12/news-1074604_640.jpg',
          "liked": true,
        },
        {
          "newsTitle": 'Daily Planet',
          'newsSubtitle':
              'The world is still under the terror of new covid wave.',
          'date': '3rd August ',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/Mental-Health-Awareness-Week-2021-theme.jpg'
        },
      ];
  get listTiles4 => [
        {
          "newsTitle": 'World News ',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '6th August 2021',
          'imageUrl':
              'http://static.dnaindia.com/sites/default/files/2018/04/14/671873-neeraj-chopra-gold-afp.jpg'
        },
        {
          "newsTitle": 'London Times ',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '5hr ago',
          'imageUrl':
              'https://www.thesportsgeek.com/wp-content/uploads/2020/06/2021-Olympic-Logo-825x400.jpg'
        },
        {
          "newsTitle": 'India Today',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://s3images.zee5.com/wp-content/uploads/sites/7/2021/08/india-vs-england-784x441.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://i.pinimg.com/originals/55/55/9c/55559cfe50a9870c3ea7dd034f0997e5.jpg'
        },
        {
          "newsTitle": 'Sports News',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://dehayf5mhw1h7.cloudfront.net/wp-content/uploads/sites/1363/2020/04/10080746/trials-opening-currie-885x544-1.jpg'
        },
      ];
  get listTiles5 => [
        {
          "newsTitle": 'World News ',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '5hr ago',
          'imageUrl':
              'https://www.e-zigurat.com/news/wp-content/uploads/sites/3/2021/03/news_agorbaim_es1.jpg'
        },
        {
          "newsTitle": 'London Times ',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '5hr ago',
          'imageUrl':
              'https://schoolofmusic.ucla.edu/app/uploads/2019/04/Final-AMOLA.png'
        },
        {
          "newsTitle": 'BBC',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.e-zigurat.com/news/wp-content/uploads/sites/3/2021/01/ited_news_1.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '5hr ago',
          'imageUrl':
              'https://images.template.net/wp-content/uploads/2019/04/Metalogic-%E2%80%93-Responsive-WordPress-Theme.jpeg'
        },
        {
          "newsTitle": 'India Today',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/Mental-Health-Awareness-Week-2021-theme.jpg'
        },
      ];
  get listTiles6 => [
        {
          "newsTitle": 'World News ',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '6hr ago',
          'imageUrl':
              'https://thumbs.dreamstime.com/b/year-coronavirus-illustration-particles-181596054.jpg'
        },
        {
          "newsTitle": 'London Times ',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '5 min ago',
          'imageUrl':
              'https://i.ebayimg.com/images/g/N04AAOSwNXlfBg~2/s-l400.jpg'
        },
        {
          "newsTitle": 'BBC',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/MHAW-2021-Hold-Twitter-Image.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.mentalhealth.org.uk/sites/default/files/Mental-Health-Awareness-Week-2021-theme.jpg'
        },
        {
          "newsTitle": 'Newyork Times',
          'newsSubtitle': 'India achieves gold for the 1st time in Athletics.',
          'date': '3rd August 2021',
          'imageUrl':
              'https://www.tentaran.com/wp-content/uploads/2021/01/latest-india-business-news-today-23-january-2021.jpg'
        },
      ];
  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }

    return new DefaultTabController(
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
                  color: Colors.white,
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
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.deepPurple,
            items: <Widget>[
              Icon(Icons.list, size: 30),
              Icon(Icons.add, size: 30),
              Icon(Icons.compare_arrows, size: 30),
            ],
            onTap: (index) {
              //Handle button tap
            },
          ),
          // body: Container(color: Colors.blueAccent),

          drawer: Drawer(
            // child: SliverAppBar(
            //   backgroundColor: Theme.of(context).backgroundColor,
            //   leading: Builder(
            //     builder: (context) => IconButton(
            //       icon: ImageIcon(NetworkImage(
            //           'https://images.wallpapersden.com/image/download/itachi-uchiha-anime_a2xuZmiUmZqaraWkpJRnbmhnrWduaGc.jpg')),
            //       onPressed: () => Scaffold.of(context).openDrawer(),
            //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            //     ),
            //   ),
            // ),
            //   child: Container(
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

                  leading: Icon(Icons.person, size: 25, color: Colors.black),
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
                      MaterialPageRoute(builder: (context) => Profile2()),
                    );
                  },
                //   trailing: IconButton(
                //     icon: Icon(Icons.arrow_forward_ios_outlined,
                //         color: Colors.deepPurple), // set your color here
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => ProfilePage()));
                //     },
                // )
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: Icon(Icons.favorite, size: 25, color: Colors.black),
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
                  leading: Icon(Icons.post_add, size: 25, color: Colors.black),
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
                  leading: Icon(Icons.share, size: 25, color: Colors.black),
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
                  leading:
                      Icon(Icons.info, size: 25, color: Colors.black),
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
}
