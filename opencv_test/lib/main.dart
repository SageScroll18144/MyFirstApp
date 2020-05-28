import 'package:flutter/material.dart';
import 'package:opencv/opencv.dart';
import 'dart:io' as Io;
import 'package:image/image.dart';


void main(){
  runApp(MaterialApp(home: Cam()));
  print("asdf");
}

class Cam extends StatefulWidget {
  @override
  _CamState createState() => _CamState();
}

class _CamState extends State<Cam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OpenCV")),
    );
  }
}