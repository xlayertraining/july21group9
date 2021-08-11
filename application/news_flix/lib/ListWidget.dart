import 'dart:ui';

import 'package:flutter/material.dart';
Widget ListWidget(item){
  return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item['imageUrl']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: 5,),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(item['newsTitle'],
                  style: TextStyle(
                    fontSize: 24,fontStyle: FontStyle.italic
                  ),),

                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range,color: Colors.greenAccent,),
                    Text(
                      item['date'],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.bookmarks_outlined,color: Colors.lightBlueAccent,size: 20,),
                    // SizedBox(
                    //   width: 30,
                    // ),
                    // Icon(Icons.play_circle_fill,color: Colors.lightBlueAccent,size: 40,),

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_sharp,color: Colors.redAccent,
                        size:20
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.comment_outlined,color: Colors.blue,
                      size:20),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.share,color: Colors.pinkAccent,size: 20,),
              ],
            )
            ]
            )
            ),
        ]
        ),
      )
  );
}