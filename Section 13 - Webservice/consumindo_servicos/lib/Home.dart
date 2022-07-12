// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "Resultado";
    TextEditingController _cepController = TextEditingController();

  _recuperarCep() async {
    String cep = _cepController.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);
    String logradouro = retorno['logradouro'];
    String complemento = retorno['complemento'];
    String bairro = retorno['bairro'];
    String localidade = retorno['localidade'];

    setState(() {
      _resultado =
          "Logradouro: $logradouro\nComplemento: $complemento\nBairro: $bairro\nLocalidade: $localidade";
    });

    print(
        " Resposta logradouro: $logradouro\n Resposta complemento: $complemento\n Resposta bairro: $bairro\n Resposta localidade: $localidade");

    // print("resposta: ${response.body}");
    // print("resposta: ${response.statusCode.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              labelText: "Digite seu cep",
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _cepController,
            ),
            ElevatedButton(onPressed: _recuperarCep, child: Text("Clique aqui", style: TextStyle(fontSize: 20),)),
            Text(_resultado)
          ],
        ),
      ),
    );
  }
}
