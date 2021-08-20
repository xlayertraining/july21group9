import 'dart:ui';



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'CommentPage.dart';
import 'FullView.dart';

class ListWidget extends StatefulWidget {
  Map itemData;

  ListWidget(this.itemData);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late BuildContext? _context = null;
  late Map? item;
  Color _favIconColor = Colors.blueGrey;
  Color _favIconColor2 = Colors.blueGrey;
  Color _favIconColor3 = Colors.blueGrey;
  @override
  // void initState() {
  //   super.initState();
  //   // EasyLoading.show();
  // }
  //
  // @override
  // void deactivate() {
  //   EasyLoading.dismiss();
  //   super.deactivate();
  // }
  //
  // void loadData() async {
  //   try {
  //     EasyLoading.show();
  //     Response response = await Dio().get('https://github.com');
  //     print(response);
  //     EasyLoading.dismiss();
  //   } catch (e) {
  //     EasyLoading.showError(e.toString());
  //     print(e);
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
      item = widget.itemData;
    }

    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
                  child: Text(
                    item!['newsTitle'],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple,
                      fontStyle: FontStyle.italic,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(color: Colors.black),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 10, 10),
              child: Text(
                item!['newsSubtitle'],
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(_context!).size.width,
              height: MediaQuery.of(_context!).size.width / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item!['imageUrl']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(3),
              ),

            ),


            Divider(color: Colors.black,),
            Container(
              padding: EdgeInsets.only(
                left: 5,
                bottom: 5,
                top: 5,
                right: 5,
              ),
              child: Row(
                children: [
                  InkWell(
                    onLongPress: () {
                      print("long_press");
                    },
                    onTap: () {
                      print("click_press");
                    },
                    child: IconButton(
                      icon: Icon(
                        Icons.thumb_up_outlined,
                      ),
                      color: _favIconColor,
                      onPressed: () {
                        setState(() {
                          if (_favIconColor == Colors.blueGrey) {
                            _favIconColor = Colors.deepPurple;
                          } else {
                            _favIconColor = Colors.blueGrey;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

               InkWell(
                 onLongPress: () {
                   print("long_press");
                 },
                     onTap: () {
                      print("click_press");
                   },
                 child:IconButton(

                    icon: Icon(
                      Icons.thumb_down_outlined,),
                   color: _favIconColor2,
                      onPressed: () {
                        setState(() {

                          if (_favIconColor2 == Colors.blueGrey) {
                            _favIconColor2 = Colors.red;
                          } else {
                            _favIconColor2 = Colors.blueGrey;
                          }
                        });
                      },

                  ),
    ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommentPage()));
                    },
                    icon: Icon(
                      Icons.comment_outlined,
                      color: (item!['liked'] == null || item!['liked'] == false)
                          ? Colors.grey
                          : Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onLongPress: () {
                      print("long_press");
                    },
                    onTap: () {
                      print("click_press");
                    },
                    child:IconButton(

                      icon: Icon(
                        Icons.favorite,),
                      color: _favIconColor3,
                      onPressed: () {
                        setState(() {

                          if (_favIconColor3 == Colors.blueGrey) {
                            _favIconColor3 = Colors.redAccent;
                          } else {
                            _favIconColor3 = Colors.blueGrey;
                          }
                        });
                      },

                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black),
            Container(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
              shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(30)
              ),
               ),
                child: Text('View full news'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullView()),
                  );
                },
              ),
              // SizedBox(width: 5,),
              // Expanded(child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //
              //   children: [
              //     Text(item['newsTitle'],
              //       style: TextStyle(
              //         fontSize: 24,fontStyle: FontStyle.italic
              //       ),),
              //
              //     SizedBox(

              //       height: 5,
              //     ),
              //     Row(
              //       children: [
              //         Icon(Icons.date_range,color: Colors.greenAccent,),
              //         Text(
              //           item['date'],
              //           style: TextStyle(
              //             fontSize: 12,
              //           ),
              //         ),
              //         SizedBox(

              //           width: 10,
              //         ),
              //         Icon(Icons.bookmarks_outlined,color: Colors.lightBlueAccent,size: 20,),
              //         // SizedBox(

              //         //   width: 30,
              //         // ),
              //         // Icon(Icons.play_circle_fill,color: Colors.lightBlueAccent,size: 40,),
              //
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Icon(Icons.favorite_sharp,color: Colors.redAccent,
              //             size:20
              //         ),
              //         SizedBox(

              //           width: 30,
              //         ),
              //         Icon(Icons.comment_outlined,color: Colors.blue,
              //           size:20),
              //         SizedBox(

              //           width: 30,
              //         ),
              //         Icon(Icons.share,color: Colors.pinkAccent,size: 20,),
              //   ],
              // )
              // ]
              // )
              // ),
            ),
          ]),
    );
  }
}
