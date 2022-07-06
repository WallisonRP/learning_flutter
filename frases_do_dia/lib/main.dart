import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: "Frases do dia",
    home: Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.white
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.all(0),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          // ignore: prefer_const_constructors
          /*Text(
            "A certificação de metodologias que nos auxiliam a lidar com o entendimento das metas propostas representa uma abertura para a melho",
            textAlign: TextAlign.justify,
            )*/

          Text("t1"),

          Padding(
            padding: EdgeInsets.all(30),
            child: Text("t2"), 
          ),

          Text("t3"),
        ],
      ),
    ),
  ));
}
