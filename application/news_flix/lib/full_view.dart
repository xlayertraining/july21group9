import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/comment_page.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/dislikers.dart';
import 'package:untitled2/likers.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/time_util.dart';
import 'package:untitled2/util/toast_util.dart';

class FullView extends StatefulWidget {

  Map? newDetails;

  FullView({this.newDetails});

  @override
  _FullViewState createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {

  Map? item;
  BuildContext? _context;


  @override
  Widget build(BuildContext context) {

    if (_context == null) {
      _context = context;
      item = widget.newDetails!;
    }
    Log.i(item);
    Log.i('pub_time', TimeUtil.convertTimeStamp(item!['createdAt']));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item!['title'],
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
        backgroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item!['title'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                  // fontStyle: FontStyle.italic,
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Published On : \t',
                    style: TextStyle(
                      fontSize: 12,
                      color: Configuration.primaryColor
                    ),
                  ),
                  Text(
                    TimeUtil.convertTimeStamp(item!['createdAt']),
                    style: TextStyle(
                        fontSize: 12,
                        color: Configuration.primaryColor
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.deepPurple,
                indent: 10,
                endIndent: 10,
              ),
              (item!['imageUrl'] != null)
                  ? Container(
                width: MediaQuery.of(_context!).size.width,
                height: MediaQuery.of(_context!).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item!['imageUrl']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              )
                  : Container(),
              Divider(
                color: Colors.deepPurple,
                indent: 10,
                endIndent: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 5,
                  //   bottom: 0,
                  //   top: 0,
                  //   right: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onLongPress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Likers()));
                        },
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.thumb_up_outlined,
                              ),
                              color: (item!['liked'] == true)
                                  ? Configuration.favIconColor1 =
                                  Colors.deepPurple
                                  : Configuration.favIconColor1 = Colors.grey,
                              onPressed: () async {
                                // newsLike(item, catId: catId, position: position);
                              },
                            ),
                            (item!['like'] > 0)
                                ? Text(item!['like'].toString())
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dislikers()));
                        },
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down_outlined,
                              ),
                              color: (item!['disliked'] == true)
                                  ? Configuration.favIconColor1 =
                                  Colors.red
                                  : Configuration.favIconColor1 = Colors.grey,
                              onPressed: () async {
                                // newsDislike(item,catId:catId,position:position);

                              },
                            ),
                            (item!['dislike'] > 0)
                                ? Text(item!['dislike'].toString())
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommentPage(
                                    newsId: item!['_id'],
                                  )));
                        },
                        icon: Icon(
                          Icons.comment_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        color: (item!['fav_user'] == true)
                            ? Configuration.favIconColor3 = Colors.pink
                            : Configuration.favIconColor3 = Colors.grey,
                        onPressed: () async {
                          var favId = item!['_id'];
                          // newsFav(favId);
                          setState(() {
                            if (Configuration.favIconColor3 == Colors.grey) {
                              Configuration.favIconColor3 = Colors.pink;
                            } else {
                              Configuration.favIconColor3 = Colors.grey;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          // validate();
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.deepPurple,
                indent: 10,
                endIndent: 10,
              ),
            ]),
      ),
    );
  }

}
