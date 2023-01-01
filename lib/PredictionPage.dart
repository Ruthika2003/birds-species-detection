//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/deployment.dart';
import 'package:image/image.dart' as img;
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'dart:io';

import 'package:untitled1/deployment.dart';


class PredictionPage1 extends StatefulWidget {
  const PredictionPage1({Key? key}) : super(key:key);


  @override
  PredictionPageState createState() => PredictionPageState();
}

class PredictionPageState extends State<PredictionPage1>
{

  final picker = ImagePicker();
  File? _image;
  Image? _imageWidget;
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => PredictionPage(image: pickedFile)));
    }
    );
  }
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => PredictionPage(image: pickedFile)));
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('prediction page'),
    ),

    body: Column(
    children:<Widget>[
    Center(
    child: _image == null
    ? Text('No image selected.')
        : Container(
    constraints: BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height / 2),
    decoration: BoxDecoration(
    border: Border.all(),
    ),
    child: _imageWidget,
    ),
    ),
    SizedBox(
    height: 36,
    ),
      ElevatedButton(
        onPressed: () {
         getImageFromGallery();
        },
        child: Text(
          'Gallery',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          getImageFromCamera();
        },
        child: Text(
          'Camera',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    ],
    ),
    );

  }
}
