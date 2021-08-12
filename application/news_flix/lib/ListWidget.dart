import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {

  Map itemData;

  ListWidget(this.itemData);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  late BuildContext? _context = null;
  late Map? item;
  
  @override
  Widget build(BuildContext context) {

    if (_context == null) {
      _context = context;
      item = widget.itemData;
    }

    return Card(
        elevation: 5,
        margin: EdgeInsets.only(
          bottom: 20,
          top: 10,
          left: 10,
          right: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(_context!).size.width,
                height: MediaQuery.of(_context!).size.width/2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item!['imageUrl']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Text(item!['newsTitle'],
                style: TextStyle(
                  fontSize: 24,fontStyle: FontStyle.italic
                ),),
              Container(
                padding: EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                  top: 5,
                  right: 5,
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Icon(
                            Icons.thumb_up,
                          color: (item!['liked'] == null || item!['liked'] == false)? Colors.grey : Colors.blue,
                        ),
                    ),
                    IconButton(onPressed: () {},
                      icon: Icon(
                        Icons.thumb_down,
                        color: (item!['liked'] == null || item!['liked'] == false)? Colors.grey : Colors.blue,
                      ),
                    ),
                    IconButton(onPressed: () {},
                      icon: Icon(
                        Icons.comment,
                        color: (item!['liked'] == null || item!['liked'] == false)? Colors.grey : Colors.blue,
                      ),
                    ),
                    IconButton(onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: (item!['liked'] == null || item!['liked'] == false)? Colors.grey : Colors.blue,
                      ),
                    ),
                  ],
                ),
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
            ]
        )
    );
  }
}
