import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",
    home: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          FlatButton(
              onPressed: () {
                print("Você clicou no botão");
              },
              height: 100,
              minWidth: 300,
              color: Colors.blue,
              child: Text(
                "Clique aqui",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ))
        ],
      ),
    ),
  ));
}
