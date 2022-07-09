// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite um valor",
              ),
              // style: TextStyle(
              //   fontSize: 20,
              //   color: Colors.green,
              // ),
              // obscureText: true,
              onSubmitted: (String e) {
                print("Valor digitado: $e");
              },
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              print("Valor digitado: " + _textEditingController.text);
            },
             style: ElevatedButton.styleFrom(
              primary: Colors.pink
             ),
            child: Text("Salvar")
            )
        ],
      ),
    );
  }
}
