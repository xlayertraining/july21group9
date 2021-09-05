import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled2/sign_up_page.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'home_page.dart';
import 'package:lottie/lottie.dart';

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  BuildContext? _context;

  bool passShow = false;

  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.white38. withOpacity(0.9),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         colors: [Colors.white, Colors.lightBlueAccent]
        //     )
        // ),
        padding: EdgeInsets.all(30),
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
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Enter your email and password to sign in.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  hintText: 'Enter valid email id as abc@gmail.com',
                  suffixIcon: Icon(Icons.email, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: passwordController,
                obscureText: !passShow,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  hintText: 'Enter secure password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passShow = !passShow;
                      });
                    },
                    icon: (passShow == true)
                        ? Icon(Icons.visibility, color: Colors.black)
                        : Icon(Icons.visibility_off, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
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
                    InkWell(
                      child: Text(
                        'Forget password?',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

                      ),
                      onTap: () {
                        forgotValidate();
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade400,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
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
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyWidget()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don\'t have an account?"),
                    SizedBox(width: 5,),
                    Text("Sign Up",
                      style: TextStyle(color: Colors.deepPurple,fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validate() async {
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
    var response;

    try {
      response = await Dio().post(
        Configuration.serverUrl + "/sign_in",
        data: {
          "emailAddress": emailController.text,
          "password": passwordController.text
        },
      );
    } catch (e, s) {
      Log.i(e, s);
      response = null;
    }

    if (response == null) {
      ToastUtil.info(_context!, message: "Failed, please try again later.");
      return;
    }

    print(response);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      if (response.data['status']) {
        await prefs.setString(Configuration.signedInKey,
            response.data['result'][0]['Authorization']);
        Configuration.authToken = response.data['result'][0]['Authorization'];
        ToastUtil.success(_context!, message: response.data['message']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        ToastUtil.error(_context!, message: response.data['message']);
      }
    } catch (e, s) {
      print(e.toString() + s.toString());
    }
  }
  forgotValidate() async {
    ToastUtil.info(
      _context!,
      message: "This feature is coming soon.",
    );
    return;
  }
}
