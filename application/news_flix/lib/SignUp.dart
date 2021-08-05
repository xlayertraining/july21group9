import 'package:flutter/material.dart';


import 'package:untitled2/SplashScreen.dart';
import 'package:untitled2/homepage.dart';


class SignUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS FLIX',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(
              color:Colors.white ),
          title: Text(
            "Welcome",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white70,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign Up Form",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "First name",
                  labelStyle: TextStyle(color: Colors.pink),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "Last name",
                  labelStyle: TextStyle(color: Colors.pink),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.pink),
                      hintText: 'Male or Female or Others',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "Email Or Phone No.",
                  labelStyle: TextStyle(color: Colors.pink),
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.pink),
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Submit",style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(primary: Colors.pink),
                ),
                SizedBox(height: 20.0),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).pop(
                //         MaterialPageRoute(builder: (context) => Myapp()));
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}
