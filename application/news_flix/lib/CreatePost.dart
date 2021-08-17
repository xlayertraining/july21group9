import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatefulWidget {
  final double maxImageWidth;
  final double maxImageHeight;
  final Function(File) onImageSelected;

  const AppImagePicker(
      {required Key key,
      required this.maxImageWidth,
      required this.maxImageHeight,
      required this.onImageSelected})
      : super(key: key);

  @override
  _AppImagePickerState createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }

  _getImage(ImageSource src) async {
    var img = await ImagePicker.pickImage(
        source: src, maxHeight: widget.maxImageHeight, maxWidth: widget.maxImageWidth);
    widget.onImageSelected(img);
  }
}
