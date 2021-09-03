import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/full_view.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<String> images = [
    "assets/default-avatar.jpg",
    "assets/default-avatar.jpg",
    "assets/default-avatar.jpg",
    "assets/default-avatar.jpg",
    "assets/default-avatar.jpg",
    "assets/default-avatar.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          "Favourites",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
              elevation: 5,
              margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(images[index]),

                      // child: ConstrainedBox(
                      //   constraints: BoxConstraints(
                      //     minWidth: 44,
                      //     minHeight: 44,
                      //     maxWidth: 64,
                      //     maxHeight: 64,
                      //   ),
                      //   child: Image.asset(
                      //   " assets/anime wallpaper1.jpg",
                      //   fit: BoxFit.cover),
                      // )
            ),

                      title: Text(
                        'abc',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),
                      ),
                      subtitle: Text('abc',
                        style: TextStyle(color: Colors.black),),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullView()));
                      },
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      tileColor: Colors.deepPurple,
                    )
                  ]));
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
