import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
      ),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          // ignore: prefer_const_constructors
          Text('T1'),
          Text('T2'),
          Text('T3'),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ),
  ));
}
