/*import 'dart:async';
import 'webViewController'

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikipediaExplorer extends StatefulWidget {
  const WikipediaExplorer({Key? key,required this.name}) : super(key: key);
  final String name;
  @override
  WikiState createState() => WikiState();
}

class WikiState extends State<WikipediaExplorer> {
  late WebViewController _controller;
  late String something = 'https://en.wikipedia.org/wiki/' + widget.name;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Birds Information"),
        ),
        body: Center(
          child: WebView(
            initialUrl: something,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ),
    );
  }
}*/


/*import package flutter/material.dat
import "packagerwebview_flutter/webview_flutter.dart':
class HomeScreen extends StatelessWidget
HomeSc reen(1)
final _controller
goverride
Widget build:BuildContext context) (
return Scaffold
appliar: Applar
title: Text("Wiki Explorer'),
actions: E
NavigationControts (_controlter.future).
1.
1. " Appliar
body: WebViewl
InitialUrl: https://en wikipedia.erg/va
onWebViewCreated (MeovLewController WVC
controller. complete(wvc):
1. " MetiVine
ES Scaffold
class NavigationControls extends StateLessMiLdget (
const NavigationCont relsithis._controlleria
final controller
@override*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikipediaExplorer extends StatefulWidget {
  const WikipediaExplorer({Key? key,required this.name}) : super(key: key);
  final String name;
  @override
  WikiState createState() => WikiState();
}

class WikiState extends State<WikipediaExplorer> {
  late WebViewController _controller;
  late String something = 'https://en.wikipedia.org/wiki/' + widget.name;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Birds Information"),
        ),
        body: Center(
          child: WebView(
            initialUrl: something,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ),
    );
  }
}
