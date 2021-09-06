import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/config/configuration.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

class MyProfilePage2 extends StatefulWidget {
  MyProfilePage2();

  @override
  _MyProfilePage2 createState() => _MyProfilePage2();
}

class _MyProfilePage2 extends State<MyProfilePage2> {
  bool passShow = false;
  TextEditingController firstNameCon = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController  emailAddress= new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  BuildContext? _context;


  @override
  Widget build(BuildContext context) {

    if (_context == null) {
      _context = context;
      getuserProfile();
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            'My profile ',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined,
                color: Configuration.primaryColor), // set your color here
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: getuserProfile,
              icon: Icon(
                  Icons.refresh,
                color: Configuration.primaryColor,
              )
              ,
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 40,
              right: 40
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  (firstNameCon.text.isNotEmpty)? Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 2),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                        firstNameCon.text.split('')[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.green.shade800
                      ),
                    ),
                  ): Container(),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'First name',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                      suffixIcon: Icon(Icons.edit,color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    controller: firstNameCon,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Last name',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      prefixIcon: Icon(Icons.person_sharp, color: Colors.grey),
                      suffixIcon: Icon(Icons.edit,color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    controller: lastName,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Phone number',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      prefixIcon: Icon(Icons.phone, color: Colors.grey),
                      suffixIcon: Icon(Icons.edit,color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    controller: phoneNumber,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      prefixIcon: Icon(Icons.email, color: Colors.grey),
                      suffixIcon: Icon(Icons.edit,color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    controller: emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: !passShow,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: passwordController.text,
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      hintText: 'Enter Your password',
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passShow = !passShow;
                          });
                        },
                        icon: (passShow == true)
                            ? Icon(Icons.visibility, color: Colors.grey)
                            : Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                      suffixIcon: Icon(Icons.edit,color: Colors.grey),
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
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async
                      {
                        updateUserProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }


  getuserProfile() async {
    Response? response = null;
    try {
      response = await Dio().get(Configuration.serverUrl + "/user/profile",
          options: Options(headers: {
            'Authorization': ' Bearer ' + Configuration.authToken
          }));
      print(response);
    } catch (e, s) {
      print(e.toString() + s.toString());
    }

    try {
      if (response!.data['status']){
        firstNameCon.text = response.data['result'][0]['firstName'];
      }
    }
    catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    try {
      if (response!.data['status']){
        lastName.text = response.data['result'][0]['lastName'];
      }
    }
    catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    try {
      if (response!.data['status']){
        phoneNumber.text = (response.data['result'][0]['phoneNumber']).toString();
      }
    }
    catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    try {
      if (response!.data['status']){
        emailAddress.text = response.data['result'][0]['emailAddress'];
      }
    }
    catch (e, s) {
      Log.i(e.toString() + s.toString());
    }
    try {
      if (response!.data['status']){
        passwordController.text = response.data['result'][0]['password'];
      }
    }
    catch (e, s) {
      Log.i(e.toString() + s.toString());
    }

    Timer(
      Duration(milliseconds: 150),
          () {
        setState(() {});
      },
    );
  }

updateUserProfile() async {
  Response? response = null;
  var userData = {
    "firstName": firstNameCon.text,
    "lastName": lastName.text,
    "phoneNumber": phoneNumber.text,
    "emailAddress": emailAddress.text,
    "password": passwordController.text,
  };

  try {
    response = await Dio().put(Configuration.serverUrl + "/user/profile",
        data: userData,
        options: Options(headers: {
          'Authorization': ' Bearer ' + Configuration.authToken
        }));
    print(response);
  } catch (e, s) {
    print(e.toString() + s.toString());
  }
  try {
    if (response!.data['status']){

      ToastUtil.success(context,message: response.data['message']);
    }
  }
  catch (e, s) {
    Log.i(e.toString() + s.toString());
  }
  Timer(
    Duration(milliseconds: 150),
        () {
      setState(() { getuserProfile();});
    },
  );
}

}
