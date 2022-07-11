// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _abrirEmpresa() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("ATM Consultoria"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _abrirEmpresa,
                  child: Image.asset("images/menu_empresa.png")
                ),
                GestureDetector(
                  onTap: _abrirEmpresa,
                  child: Image.asset("images/menu_servico.png")
                )
                
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _abrirEmpresa,
                  child: Image.asset("images/menu_cliente.png")
                ),
                GestureDetector(
                  onTap: _abrirEmpresa,
                  child: Image.asset("images/menu_contato.png")
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
