import 'package:flutter/material.dart';

import 'package:untitled2/SignUp.dart';

import 'homepage.dart';
import 'package:lottie/lottie.dart';
void main() {
  runApp(MaterialApp(home: Myapp()));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
        return Scaffold(
          backgroundColor: Colors.white38. withOpacity(0.9),
      body: Container(
        padding: EdgeInsets.all(10),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height * 0.35,
                child: Lottie.asset(
                  'assets/news animation.json',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        fontStyle: FontStyle.italic,
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                  hintText: 'Enter valid email id as abc@gmail.com',
                  suffixIcon: Icon(Icons.email, color: Colors.black87),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(25.0),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.black87),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                  hintText: 'Enter secure password',
                  suffixIcon: Icon(Icons.visibility_off,color: Colors.black87),
                 enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(25.0),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.black87),
                      borderRadius: BorderRadius.circular(25.0),
                    ),

                  ),
                ),

              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Forget password?',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyWidget()));
                },
                child: Text.rich(
                  TextSpan(text: 'Don\'t have an account', children: [
                    TextSpan(
                      text: 'Signup',
                      style: TextStyle(color:Colors.deepPurpleAccent),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
