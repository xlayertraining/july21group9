import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:untitled2/util/log_util.dart';
import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker();

  @override
  _AppImagePickerState createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  String? _value;
  BuildContext? _context;
  File newsImage = new File('');
var newsCategoryIndex;
  get picker => null;
  // int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Create Post",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
        ),
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
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title :",
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                maxLength: 200,
                maxLines: 3,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Description :",
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                maxLines: 8,
                maxLength: 2000,
              ),
              DropdownFormField<Map<String, dynamic>>(
                onEmptyActionPressed: () async {},
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    labelText: "Access"),
                onSaved: (dynamic str) {},
                onChanged: (dynamic str) {},
                validator: (dynamic str) {},
                displayItemFn: (dynamic item) {
                  Log.i(item);
                  if (item == null) {
                    return Text(
                      'N/A',
                      style: TextStyle(fontSize: 16),
                    );
                  }
                  return Text(
                    item['name'] ?? '',
                    style: TextStyle(fontSize: 16),
                  );
                },
                findFn: (dynamic str) async => _roles,
                filterFn: (dynamic item, str) =>
                item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
                dropdownItemFn: (dynamic item, position, focused,
                    dynamic lastSelectedItem, onTap) =>
                    ListTile(
                      title: Text(item['name']),
                      subtitle: Text(
                        item['desc'] ?? '',
                      ),
                      tileColor:
                      focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                      onTap: onTap,
                    ),
              ),
              (newsImage.path.isNotEmpty)
                  ? Image.file(newsImage)
                  : Icon(
                      Icons.image,
                      size: 90,
                    ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                iconSize: 50.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                            title: Text("Camera/Gallery"),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () async {
                                  Navigator.pop(context); //close the dialog box
                                  _getImage(ImageSource.gallery);
                                },
                                child: const Text('Pick From Gallery'),
                              ),
                              SimpleDialogOption(
                                onPressed: () async {
                                  Navigator.pop(context); //close the dialog box
                                  _getImage(ImageSource.camera);
                                },
                                child: const Text('Take A New Picture'),
                              ),
                            ]);
                      });
                },
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    getHttp();
                    // call that api
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Upload")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getImage(ImageSource src) async {
    var img = await ImagePicker().pickImage(
        source: src, maxHeight: 150, maxWidth: 150, imageQuality: 70);
    if (img != null) {
      newsImage = new File(img.path);
    } else {
      newsImage = new File('');
      ToastUtil.error(_context!, message: "No image is selected.");
    }
    setState(() {});
  }

  void getHttp() async {
    FormData? postFormData;

    if (titleController.text.isEmpty) {
      ToastUtil.error(_context!, message: 'Please enter news title.');
      return;
    }

    if (descriptionController.text.isEmpty) {
      ToastUtil.error(_context!, message: 'Please enter news description.');
      return;
    }

    if (newsImage.path.isEmpty) {
      postFormData = FormData.fromMap({
        'title': titleController.text,
        'description': descriptionController.text,
        'category': json.encode([1,2,3]),
      });
    } else {
      postFormData = FormData.fromMap({
        'title': titleController.text,
        'description': descriptionController.text,
        'category': [1,2,3],
        'image': await MultipartFile.fromFile(newsImage.path,
            filename: newsImage.path
                .split('/')[newsImage.path.split('/').length - 1]),
      });
    }

    Response? response;
    try {
      response = await Dio().post(
        Configuration.serverUrl + "/news",
        data: postFormData,
        options: Options(
            headers: {'Authorization': ' Bearer ' + Configuration.authToken}),
      );
      print(response);
    } catch (e) {
      print(e);
      response = null;
    }


    try {
      if (response!.data['status']) {
        ToastUtil.success(_context!, message: response.data['message']);
      } else {
        ToastUtil.error(_context!, message: response.data['message']);
      }
    } catch (e, s) {
      Log.e(e, s);
    }

  }
}
