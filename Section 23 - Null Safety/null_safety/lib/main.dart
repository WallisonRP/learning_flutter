import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Null Safety",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variáveis não nulas
  String nome = "";
  int idade = 1;
  double altura = 1.1;

  //Variáveis nulas
  String? descricao;
  int? id;
  double? peso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Null Safety"),
      ),
    );
  }
}
