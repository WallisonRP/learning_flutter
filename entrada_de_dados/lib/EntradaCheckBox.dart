// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  @override
  State<EntradaCheckBox> createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool? _comidaBrasileira = false;
  bool? _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [
            CheckboxListTile(
              title: Text("Comida brasileira"),
              subtitle: Text("Uma delicia"),
              value: _comidaBrasileira,
              // activeColor: Colors.pink,
              // secondary: Icon(Icons.add_box),
              onChanged: (bool? valor) {
                setState(() {
                  _comidaBrasileira = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida mexicana"),
              subtitle: Text("Picante"),
              value: _comidaMexicana,
              // activeColor: Colors.pink,
              // secondary: Icon(Icons.add_box),
              onChanged: (bool? valor) {
                setState(() {
                  _comidaMexicana = valor;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(
                      "Comida brasileira: ${_comidaBrasileira.toString()} \n Comida mexicana ${_comidaMexicana.toString()}");
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ))

            /*
            Text("Comida brasileira"),
            Checkbox(
              value: _estaSelecionado,
              onChanged: (bool? valor) {
                setState(() {
                  _estaSelecionado = valor;
                });
              },
            ),
            */
          ],
        ),
      ),
    );
  }
}
