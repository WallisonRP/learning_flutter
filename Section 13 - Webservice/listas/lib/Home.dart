// ignore_for_file: prefer_const_constructors

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
                onTap: () {
                  // print("Clicou no item $index");
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_itens[index]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle:
                              TextStyle(fontSize: 20, color: Colors.orange),
                          content: Text(_itens[index]["descricao"]),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  print("Selecionado sim.\nItem: $index");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")),
                            ElevatedButton(
                                onPressed: () {
                                  print("Selecionado não.\nItem: $index");
                                  Navigator.pop(context);
                                },
                                child: Text("Não")),
                          ],
                        );
                      });
                },
                // onLongPress: () {
                //   print("Clicou 2");
                // },
                title: Text(_itens[index]["titulo"]),
                subtitle: Text(_itens[index]["descricao"]),
              );
            }),
      ),
    );
  }
}
