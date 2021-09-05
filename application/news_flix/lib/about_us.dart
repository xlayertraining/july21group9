import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {

  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,
          color: Colors.deepPurple,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "About us",
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body:Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(

                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.2,
                  0.5,
                  0.8,
                  0.9,
                ],
                colors: [
                  Colors.purple.shade50,
                  Colors.deepPurple.shade100,
                  Colors.deepPurple.shade200,
                  Colors.deepPurple.shade300,
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('FrontEnd Team :',style: TextStyle(fontSize: 20,
                    fontWeight:FontWeight.bold,
                color: Colors.deepPurple)),
                SizedBox(height: 30),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/samyadeep.jpg',
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Samyadeep Saha',
                            style: TextStyle(fontStyle: FontStyle.italic,
                                fontSize: 14)),
                        SizedBox(height: 40),
                      ],
                    ),
                      SizedBox(width: 85,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/basab (2).JPEG',
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Basabjit Singha Ray',
                            style: TextStyle(fontStyle: FontStyle.italic,
                                fontSize: 14)),
                        SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Text('BackEnd Team :',style: TextStyle(fontSize: 20,
                    fontWeight:FontWeight.bold)),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/aniket.jpg',
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Aniket Lodh',
                              style: TextStyle(fontStyle: FontStyle.italic,
                                  fontSize: 14)),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                    SizedBox(width: 95,),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/nabanit.jpg',
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Nabanit Roy',
                              style: TextStyle(fontStyle: FontStyle.italic,
                              fontSize: 14)),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(" Special thanks to :", style: TextStyle(fontStyle: FontStyle.normal,
                    fontSize: 20)),
                Divider(color: Colors.deepPurple,
                  indent: 4,
                  endIndent: 4,),
                Text(" Mr.Soumik Debnath.", style: TextStyle(fontStyle: FontStyle.italic,
                    fontSize: 18)),
                Text(" Mr.Prithviraj Amin.", style: TextStyle(fontStyle: FontStyle.italic,
                    fontSize: 18)),
              ],
            ),
        ),
      ),


      );
  }
}
