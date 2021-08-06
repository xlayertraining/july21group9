import 'package:flutter/material.dart';
import 'shared/listitem.dart';
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
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 5,),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['newsTitle'],
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      item['author'],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.date_range),
                    Text(
                      item['date'],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            )
            )
          ],
        ),
      )
  );
}