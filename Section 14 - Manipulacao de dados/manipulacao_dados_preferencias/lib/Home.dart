// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controleDeCampo = TextEditingController();

  _salvar() {

  }

  _recuperar() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text("", style: TextStyle(fontSize: 20),),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controleDeCampo,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: _salvar, child: Text("Salvar", style: TextStyle(fontSize: 20),), style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),),
                ElevatedButton(onPressed: _recuperar, child: Text("Recuperar", style: TextStyle(fontSize: 20)), style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
