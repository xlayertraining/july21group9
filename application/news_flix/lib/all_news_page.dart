import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostLIstview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            'All news',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
            ),
          ),
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
        backgroundColor: Colors.white,
        body:Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(4),
                color: Colors.white60,
                margin: EdgeInsets.all(20.0),
                child: Text("News:",style: TextStyle(fontSize: 25,color: Colors.deepPurple),)),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 8,right: 8),
              height: 700,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context,index){

                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: Column(
                          children: [
                            Image.network("https://powerbacks.com/wp-content/uploads/2019/09/google-slides-icon.png",
                              width: 300,height: 300,),
                            Container(
                                width: double.infinity,
                                color: Colors.grey[200],
                                 child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                   child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                     shape:  RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(30)),
                                         primary: Colors.white),
                                     child: Text('Approve',
                                       style: TextStyle(color: Colors.deepPurple, fontSize: 15),
                                     ),
                                     onPressed: () {
                                     },
                                ),
                            ),),
                            Container(
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                    primary: Colors.deepPurple
                                  ),
                                  child: Text('Deny'),
                                  onPressed: () {
                                  },
                                ),
                              ),),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
                          ],
                        ),
                      ),
      )
                    );
                  }
  }