import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/util/toast_util.dart';

import 'config/configuration.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker();

  @override
  _AppImagePickerState createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  BuildContext? _context;
  File newsImage = new File('');

  get picker => null;
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    if (_context == null) {
      _context = context;
    }

    return Scaffold(
      appBar: AppBar(
        title:Text("Create Post")
      ),
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
              DropdownButton(
                  value: selectedValue,
                  items: [
                    DropdownMenuItem(
                      child: Text("latest"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("national"),
                      value: 2,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedValue = 2;
                    });
                  }
              ),

              (newsImage.path.isNotEmpty)
                  ? Image.file(newsImage)
                  : Icon(
<<<<<<< Updated upstream
                Icons.image,
                size: 90,
              ),
=======
                      Icons.image,
                      size: 90,
                    ),

>>>>>>> Stashed changes
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
                    getHttp();
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
      var CmpressedImage;
      try {
        CmpressedImage = await FlutterImageCompress.compressWithFile(
            img.path,
            format: CompressFormat.heic,
            quality: 70
        );
      } catch (e) {
        CmpressedImage = await FlutterImageCompress.compressWithFile(
            img.path,
            format: CompressFormat.jpeg,
            quality: 70
        );
      }
        // setState(() async {
        //   newsImage = new File(img.path);
        // }
        // );
      return  CmpressedImage;
      }
    else {
      ToastUtil.error(_context!, message: "No image is selected.");
    }
  }
<<<<<<< Updated upstream
}
=======
}

void getHttp() async {
  try {
    var img;
    var response = await Dio().post(Configuration.serverUrl + "/post", data: {
      "title": "test1",
      "description": "test1",
      "image": "1 2 ka 4 " ,
      "category": [0, 1, 2],
    }
    );
    print(response);
  } catch (e) {
    print(e);
  }
}
>>>>>>> Stashed changes
