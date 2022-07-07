import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteudo principal"),
        ),
      
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text("Texot 1"),
              Text("Texto 2")
          ]
          ),
          ),
      ),
    ) ,
  ));
}
