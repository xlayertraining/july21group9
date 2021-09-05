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
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 3,
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "About us",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FrontEnd Team :',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
            SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/samyadeep.jpg',
              ),
            ),
            SizedBox(height: 10),
            Text('Samyadeep Saha'),
            SizedBox(height: 90),
            Text('BackEnd Team :',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
            SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/aniket.jpg',
              ),
            ),

            SizedBox(height: 10),
            Text('Aniket Lodh'),
            SizedBox(height: 40),

          ],
        ),


      );
  }
}
