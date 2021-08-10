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
        // appBar: AppBar(
        //   backgroundColor: Colors.pink,
        //   iconTheme: IconThemeData(
        //       color:Colors.black ),
        //   title: Text(
        //     "Welcome",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.purpleAccent.shade100]
              )
          ),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          // color: Colors.white70,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Sign Up Form",
                  style: TextStyle(fontSize: 25.0,color: Colors.red.shade500, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "First name",
                  labelStyle: TextStyle(color: Colors.red.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "Last name",
                  labelStyle: TextStyle(color: Colors.red.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.red.shade500),
                      hintText: 'Male or Female or Others',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: " Phone No.",
                      labelStyle: TextStyle(color: Colors.red.shade500),
                      suffixIcon: Icon(Icons.phone,color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.red.shade500),
                  suffixIcon: Icon(Icons.email,color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.red.shade500),
                    suffixIcon: Icon(Icons.visibility_off,color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Submit",style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
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
