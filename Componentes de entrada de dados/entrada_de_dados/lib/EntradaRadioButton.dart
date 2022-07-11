// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String? _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile(
                title: Text("Masculino"),
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }),
            RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }),
            RadioListTile(
                title: Text("Outros"),
                value: "o",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  print("Escolha: $_escolhaUsuario");
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20),
                ))

            /*
            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                  print("Escolha: $escolha");
                }),
            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                  print("Escolha: $escolha");
                })
                */
          ],
        ),
      ),
    );
  }
}
