import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:untitled1/wiki.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';


class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key,required this.image}) : super(key: key);
  final XFile image;

  @override
  PredictionPageState createState() => PredictionPageState();
}

class PredictionPageState extends State<PredictionPage> {

  // late File _image;
  late List _results;
  bool imageSelect=false;

  @override
  void initState()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(model: "assets/tflite/birds_450_quant_image_inceptionV3_metadata.tflite",labels: "assets/tflite/labels_450.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      widget.image;
      imageSelect=true;

    });
  }
  late var name= _results[0]['label'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Prediction Page"),
        ),
        body: ListView(
            children: [
            /*(imageSelect)?*/Container(
    margin: const EdgeInsets.all(10),
    child: Image.file(File(widget.image!.path)),
    ),
    // ,Container(
    //   margin: const EdgeInsets.all(10),
    //   child: const Opacity(
    //     opacity: 0.8,
    //     child: Center(
    //       child: Text("No image selected"),
    //     ),
    //   ),
    // ),
    SingleChildScrollView(
    child: Column(
    children: (imageSelect)?_results.map((result) {
    return Card(
    child: Container(
    margin: EdgeInsets.all(10),
    child: Text(
    "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
    style: const TextStyle(color: Colors.black,
    fontSize: 20),
    ),
    ),
    );
    }).toList():[],

    ),
    ),

    RawMaterialButton(
    fillColor: const Color(0xFFB388FF),
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0)),
    onPressed:() async{
    // if(widget.image!=null)
    //   {
    imageClassification(File(widget.image!.path));
    // }


    },
    child: const Text("Predict",style: TextStyle(color: Colors.white,
    fontSize: 18.0,))
    ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: ()
    //     {
    //       imageClassification(File(widget.image!.path));
    //     },
    //   tooltip: "Pick Image",
    //   child: const Icon(Icons.image),
          RawMaterialButton(
              fillColor: const Color(0xFFB388FF),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed:() async{
                // if(widget.image!=null)
                //   {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:( context)=> WikipediaExplorer(name:name.toString().toLowerCase())));
                // }
              },
              child: const Text("Information",style: TextStyle(color: Colors.white,
                fontSize: 18.0,))
          ),
                ],



    ),
    );
  }}
