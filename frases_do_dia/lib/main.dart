import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  var _titulo = "Frases do dia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteudo principaal"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(children: [Text("Texot 1"), Text("Texto 2")]),
        ),
      ),
    );
  }
}
