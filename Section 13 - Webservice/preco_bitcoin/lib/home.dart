// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String _exibirResultado = "";

  void _buscaValores() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = jsonDecode(response.body);
    print(retorno["BRL"]["buy"]);

    setState(() {
      _exibirResultado = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "R\$ " + _exibirResultado,
                style: TextStyle(fontSize: 40, color: Colors.black54),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    padding: EdgeInsets.only(
                        top: 16, bottom: 16, left: 32, right: 32)),
                onPressed: _buscaValores,
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
