import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/util/toast_util.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker();

  @override
  _AppImagePickerState createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  BuildContext? _context;
  File newsImage = new File('');

  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                maxLength: 200,
                maxLines: 3,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 8,
                maxLength: 2000,
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
                  onPressed: () {
                    // call that api
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Create Post")],
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
        source: src, maxHeight: 300, maxWidth: 600, imageQuality: 70);
    if (img != null) {
      setState(() {
        newsImage = new File(img.path);
      });
    } else {
      ToastUtil.error(_context!, message: "No image is selected.");
    }
  }
}