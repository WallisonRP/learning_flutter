// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'telas/Inicio.dart';
import 'telas/EmAlta.dart';
import 'telas/Inscricoes.dart';
import 'telas/Biblioteca.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 30,
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Ação: videocam");
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                print("Ação: search");
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("Ação: account");
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        // unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Em alta", icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              label: "Inscrições", icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              label: "Biblioteca", icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
