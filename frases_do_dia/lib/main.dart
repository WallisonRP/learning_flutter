import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    title: "Frases do dia",
    home: Column(children: [
      Text("Usuário:"),
      Text("Senha:"),
      Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      
    ],),
    //home: Container(color: Colors.white,),
  ));

}
