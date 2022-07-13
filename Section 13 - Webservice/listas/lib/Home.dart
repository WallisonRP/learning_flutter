import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo $i Lorem Lorem Lorem Lorem.";
      item["descricao"] = "Descrição $i Lorem Lorem Lorem Lorem.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, index) {
              // Map<String, dynamic> item = _itens[index];
              // print("Item: ${item["titulo"].toString()}");
              return ListTile(
                title: Text(_itens[index]["titulo"].toString()),
                subtitle: Text(_itens[index]["descricao"].toString()),
              );
            }),
      ),
    );
  }
}
