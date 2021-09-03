import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/util/log_util.dart';

import 'config/configuration.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchKeyWord = new TextEditingController();
  var newstile = [];
  bool searchResult = true;
  final titles = ["Title 1", "List 2", "List 3"];
  final subtitles = [
    "Here is title 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];

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
      body:
          // (searchResult == true) ?
          ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print("ciao"),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset("assets/anime wallpaper1.jpg",
                          width: 300, height: 150, fit: BoxFit.fill),
                    ),
                    ListTile(
                      title: Text('Title 1'),
                      subtitle: Text('Description 1'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  searchNews() async {
    Response? resp = null;
    resp = await Dio().get(
        Configuration.serverUrl + '/news/search?keyword=' + searchKeyWord.text,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}));

    try {
      newstile = resp.data['result'];
      print(resp);
      searchResult = true;
      Log.i('0_length', newstile.length.toString());
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

//   Widget buildCard(item) {
//     return Card(
//       elevation: 5,
//       margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
//                   child: Text(
//                     item!['title'],
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.deepPurple,
//                       // fontStyle: FontStyle.italic,
//                       decorationStyle: TextDecorationStyle.double,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Divider(
//               color: Colors.deepPurple,
//               indent: 10,
//               endIndent: 10,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
//                   child: Text(
//                     item!['description'],
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.deepPurple,
//                       // fontStyle: FontStyle.italic,
//                       decorationStyle: TextDecorationStyle.double,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Divider(
//               color: Colors.deepPurple,
//               indent: 10,
//               endIndent: 10,
//             ),
//             (item!['imageUrl'] != null)
//                 ? Container(
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               height: MediaQuery
//                   .of(context)
//                   .size
//                   .width / 2,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(item!['imageUrl']),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(3),
//               ),
//             )
//                 : Container(),
//           ]
//       ),
//     );
//   }
