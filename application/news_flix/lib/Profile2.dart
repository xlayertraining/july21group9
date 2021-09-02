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
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined,
                color: Colors.deepPurple), // set your color here
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.black26,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.seekpng.com/png/detail/138-1387681_clip-art-black-and-white-stock-clip-art.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                      left: 90,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: firstNameCon.text,
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      suffixIcon: Icon(Icons.edit, color: Colors.black),
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
                      labelText: lastName.text,
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      suffixIcon: Icon(Icons.edit, color: Colors.black),
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
                      labelText: phoneNumber.text,
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      suffixIcon: Icon(Icons.edit, color: Colors.black),
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
                      labelText: emailAddress.text,
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      suffixIcon: Icon(Icons.edit, color: Colors.black),
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
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async
                      {
                        updateUserProfile();

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                      ),
                      child: Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontSize: 23,
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
      response = await Dio().get(Configuration.serverUrl + "/profile",
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
  }

updateUserProfile() async {
  Response? response = null;
  var userData = FormData.fromMap({
    "firstName": firstNameCon.text,
    "lastName": lastName.text,
    "phoneNumber": phoneNumber.text,
    "emailAddress": emailAddress.text,
    "password": passwordController.text,
  });

  try {
    response = await Dio().post(Configuration.serverUrl + "/user/profile",
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
}

}
