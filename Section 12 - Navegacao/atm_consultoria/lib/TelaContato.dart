// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({Key? key}) : super(key: key);

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Contatos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("images/detalhe_contato.png"),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                  "Contatos",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                  )
                ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "wallison0076@gmail.com"
              ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Celular: (16) 99730-8626"
              ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Celular: (16) 99730-8626"
              ),
              )
          ],
        ),
        ),
      ),
    );
  }
}