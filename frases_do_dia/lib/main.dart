import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
    var _texto = "Wallison Franklin";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                  _texto = "Curso Flutter";
                  });
                },
                style: ElevatedButton.styleFrom(primary: Colors.pink),
                child: Text("Clique aqui")),
            Text("Nome: $_texto")
          ],
        ),
      ),
    );
  }
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
