// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  const AlcoolOuGasolina({Key? key}) : super(key: key);

  @override
  State<AlcoolOuGasolina> createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina")
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Image.asset("images/logo.png"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Saiba qual a melhor opção para abastecer seu carro",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Alcool, ex: 3,89",
            ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerAlcool,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Gasolina, ex: 5,89",
            ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerGasolina,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              padding: EdgeInsets.all(15)
            ),
            child: Text(
              "Calcular",
              style: TextStyle(
                fontSize: 20
              ),
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Resultado",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
              ),
          )
      ]
      ),
        ),
      ),
    );
  }
}
