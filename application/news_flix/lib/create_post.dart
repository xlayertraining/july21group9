import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
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
                  labelText: "Title",
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
                maxLength: 200,
                maxLines: 3,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
                maxLines: 8,
                maxLength: 2000,
              ),
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.filter_1),
                        Text('Latest'),
                      ],
                    ),
                    value: 'zero',
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.filter_2),
                        Text('National'),
                      ],
                    ),
                    value: 'one',
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.filter_3),
                        Text('International'),
                      ],
                    ),
                    value: 'two',
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.filter_4),
                        Text('Sports'),
                      ],
                    ),
                    value: 'three',
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.filter_5),
                        Text('Tech'),
                      ],
                    ),
                    value: 'four',
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.filter_6),
                        Text('Business'),
                      ],
                    ),
                    value: 'five',
                  ),
                ],
                isExpanded: false,
                onChanged: (String? value) {
                  setState(() {
                    _value = value;
                    newsCategoryIndex = value;
                  });
                },
                hint: Text(
                  'Select Item',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                value: _value,
                underline: Container(
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.deepPurple))),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                iconEnabledColor: Colors.pink,
                //        iconDisabledColor: Colors.grey,
                iconSize: 40,
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
    setState(() {
    });
  }

  void getHttp() async {
    // if (newsImage.path.isEmpty) {
    //   ToastUtil.error(_context!, message: 'failed to get image');
    //   return;
    // }
    print(newsCategoryIndex);
    try {
      var postFormData = FormData.fromMap({
        'title': titleController.text,
        'description': descriptionController.text,
        'category': [newsCategoryIndex],
        'image': await MultipartFile.fromFile(newsImage.path,
            filename: newsImage.path
                .split('/')[newsImage.path.split('/').length - 1]),
      });

      var response = await Dio()
          .post(Configuration.serverUrl + "/post", data: postFormData);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
