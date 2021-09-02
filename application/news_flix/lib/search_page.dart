import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                    ),
                    hintText: 'Search...',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Container(
        child: ListView(children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25, 20, 10, 0),
            title: Text(
              " Just for you",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
            title: Text(
              " Posts you have seen ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
            title: Text(" News you may like ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.grey, size: 30),
            title: Text(" News you want to know ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.grey, size: 30),
            title: Text("Videos you may like ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.grey, size: 30),
            title: Text(" Events you may like ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ]),
      ),
    );
  }
}
