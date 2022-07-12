// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarCep() async {
    String url = "https://viacep.com.br/ws/14098374/json/";
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);
    String logradouro = retorno['logradouro'];
    String complemento = retorno['complemento'];
    String bairro = retorno['bairro'];
    String localidade = retorno['localidade'];

    print(
      " Resposta logradouro: $logradouro\n Resposta complemento: $complemento\n Resposta bairro: $bairro\n Resposta localidade: $localidade"
    );

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
            ElevatedButton(onPressed: _recuperarCep, child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
