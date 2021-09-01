import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/splash_screen.dart';
import 'package:untitled2/home_page.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/util/toast_util.dart';

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
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  BuildContext? _context;
  bool passShow = false;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 60,
            title: Text(
              'Sign up ',
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
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.25,
                      child: Lottie.asset(
                        "assets/Sign Up.json",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: firstnameController,
                          decoration: InputDecoration(
                              labelText: "First name :",
                              labelStyle: TextStyle(
                                  color: Colors.deepPurpleAccent.shade100),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                            controller: lastnameController,
                            decoration: InputDecoration(
                                labelText: "Last name :",
                                labelStyle: TextStyle(
                                    color: Colors.deepPurpleAccent.shade100),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.black))),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: "Contact No.",
                              labelStyle: TextStyle(
                                  color: Colors.deepPurpleAccent.shade100),
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Colors.deepPurpleAccent.shade100),
                              prefixIcon: Icon(Icons.mail, color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                            controller: passwordController,
                            obscureText: !passShow,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Colors.deepPurpleAccent.shade100),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passShow = !passShow;
                                  });
                                },
                                icon: (passShow == true)
                                    ? Icon(Icons.visibility, color: Colors.grey)
                                    : Icon(Icons.visibility_off,
                                        color: Colors.grey),
                              ),
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            validate();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 8,
                              bottom: 8,
                            ),
                            // createAlbum("test string");
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }

  validate() async {
    if (firstnameController.text.isEmpty) {
      ToastUtil.error(
        _context!,
        message: "Enter your First Name.",
      );
      return;
    }
    if (lastnameController.text.isEmpty) {
      ToastUtil.error(
        _context!,
        message: "Enter your Last Name.",
      );
      return;
    }
    if (phoneController.text.isEmpty) {
      ToastUtil.error(
        _context!,
        message: "Enter your Contact No.",
      );
      return;
    }
    if (emailController.text.isEmpty) {
      ToastUtil.error(
        _context!,
        message: "Enter your email.",
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      ToastUtil.error(_context!, message: "Enter your password.");
      return;
    }
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
    var response;
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
    try {
      response = await Dio().post(
        Configuration.serverUrl + "/sign_up",
        data: {
          "firstName": firstnameController.text,
          "lastName": lastnameController.text,
          "emailAddress": emailController.text,
          "phoneNumber": phoneController.text,
          "password": passwordController.text
        },
      );
    } catch (e, s) {
      print(e.toString() + s.toString());
    }
    try {
      print(response);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (response.data['status']) {
        await prefs.setString(Configuration.signedInKey,
            response.data['result'][0]['Authorization']);
        Configuration.authToken = response.data['result'][0]['Authorization'];
        ToastUtil.info(_context!, message: response.data['message']);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ToastUtil.error(_context!, message: response.data['message']);
      }
    } catch (e, s) {
      print(e.toString() + s.toString());
    }
  }
}
