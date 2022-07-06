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
      child: Column(children: [
        Image.asset(
        "images/mesa.jpg",
        fit: BoxFit.contain,
      ),
      Image.asset(
        "images/parque.jpg",
        fit: BoxFit.contain,
      )
      ]),
    ),
  ));
}
