import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: _recuperarPreco(),
        builder: (context, snapshop) {
          String _resultado = "";
          switch (snapshop.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              _resultado = "Carregando...";
              print("Conexão waiting");
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              print("Conexão done");
              if (snapshop.hasError) {
                _resultado = "Erro ao carregar os dados";
              } else {
                double valor = snapshop.data?["BRL"]["buy"];
                _resultado = "Preço do bitcoin: ${valor.toString()}";
              }
              break;
          }
          return Center(
            child: Text(_resultado),
          );
        });
  }
}
