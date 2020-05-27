import 'package:flutter/material.dart';
import 'models/item.dart';
import 'package:opencv/opencv.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: new Main()));
}

class Main extends StatefulWidget {

  var itens = List<Item>();

  Main(){
    itens = [];

    itens.add(new Item(title:"jldaofj", done: false));
    itens.add(new Item(title:"jlj", done: true));

  }

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("data"),
      ),
      body: ListView.builder(
        itemCount: widget.itens.length ,
        itemBuilder: (BuildContext ctxt, int index){
          return Text(widget.itens[index].title);
        },
      
      ),
    );
  }
}