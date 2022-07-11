// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 5;
  var _textoExibido = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            Slider(
                value: _valor,
                min: 0,
                max: 10,
                label: _valor.toString(),
                divisions: 10,
                activeColor: Color(0xFFF48FB1),
                inactiveColor: Color(0xFFE1BEE7),
                onChanged: (double valor) {
                  setState(() {
                    _valor = valor;
                  });
                  print(valor);
                }),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _textoExibido = "Valor selecionado: $_valor";
                  });
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              _textoExibido,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
