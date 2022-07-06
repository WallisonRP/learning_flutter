import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Frases do dia",
    home: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              minimumSize: MaterialStateProperty.all(Size(200, 50)),
              
              ),
              onPressed: () {
                print("Você clicou no botão");
              },
              child: Text(
                "Clique aqui",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
           )
          )
          // FlatButton(
          //     onPressed: () {
          //       print("Você clicou no botão");
          //     },
          //     height: 100,
          //     minWidth: 300,
          //     color: Colors.blue,
          //     child: Text(
          //       "Clique aqui",
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.black,
          //         decoration: TextDecoration.none,
          //       ),
          //     ))
        ],
      ),
    ),
  ));
}
