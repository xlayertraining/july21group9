
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/page_transition.dart';
import 'package:rect_getter/rect_getter.dart';

import 'create_news.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {

  var controller;

  // final Duration animationDuration = Duration(milliseconds: 300);
  // final Duration delay = Duration(milliseconds: 300);
  // GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  // late Rect rect;

  void _onTap() async {
    // setState(() => rect = RectGetter.getRectFromKey(rectGetterKey)!); //<--onTap, update rect
    Navigator.of(context).push(FadeRouteBuilder(child: AppImagePicker()));
  }

  @override
  Widget build(BuildContext context) {
    return
    // Stack( //<-- Wrap Scaffold with a Stack
    //   children: <Widget>[
    Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('My News',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.deepPurple), // set your color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MyPostBody(),
      floatingActionButton:
    // RectGetter(           //<-- Wrap Fab with RectGetter
    // key: rectGetterKey,                       //<-- Passing the key
    // child:
          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.create_outlined),

        onPressed: () {
          _onTap();
          // Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //           builder: (context) => AppImagePicker()));
        },
      ),

      );
  }


}

class MyPostBody extends StatefulWidget {
  const MyPostBody({Key? key}) : super(key: key);

  @override
  _MyPostBodyState createState() => _MyPostBodyState();
}

class _MyPostBodyState extends State<MyPostBody> {
  List<String> images = [
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
    "assets/boy.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.wallpapersden.com/image/download/demon-slayer-tanjirou-kamado_a2tsa2uUmZqaraWkpJRnamtlrWZlbWU.jpg'),
                // backgroundImage: AssetImage(images[index]),
              ),

              // title: Text("This is Post Title"),
              // subtitle: Text("This is Post Description"),
              title: Text(
                'Samyadeep',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Samyadeep@gmail.com'),

              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 22,
                ),
                onPressed: () {},
              ),
            )
            );
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget child;

  FadeRouteBuilder({required this.child, })
      : super(
    pageBuilder: (context, animation1, animation2) => child,
    transitionsBuilder: (context, animation1, animation2, child) {
      return FadeTransition(opacity: animation1, child: child);
    },
  );
}
