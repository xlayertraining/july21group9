import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Likers extends StatelessWidget {
  const Likers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Liked By',
        style: TextStyle(fontStyle: FontStyle.italic,
          fontSize: 25
        ),
        ),
        backgroundColor: Colors.deepPurpleAccent.shade200,

      ),
      body: LikedBy(),
    );
  }
}
class LikedBy extends StatefulWidget {
  const LikedBy({Key? key}) : super(key: key);

  @override
  _LikedByState createState() => _LikedByState();
}

class _LikedByState extends State<LikedBy> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatarfiles.alphacoders.com/155/thumb-1920-155821.jpg'),
              ),
              title: Text(
                'Basabjit Singha Ray',
                style: TextStyle(fontStyle:FontStyle.normal),
              ),

            ),
            SizedBox(
              height: 5,
            ),

            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatarfiles.alphacoders.com/155/thumb-1920-155821.jpg'),
              ),
              title: Text(
                'Samyadeep Saha',
                style: TextStyle(fontStyle:FontStyle.normal),
              ),

            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatarfiles.alphacoders.com/155/thumb-1920-155821.jpg'),
              ),
              title: Text(
                'Nabanit Roy',
                style: TextStyle(fontStyle:FontStyle.normal),
              ),

            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatarfiles.alphacoders.com/155/thumb-1920-155821.jpg'),
              ),
              title: Text(
                'Aniket Lodh',
                style: TextStyle(fontStyle:FontStyle.normal),
              ),

            ),
          ],
    )));}}