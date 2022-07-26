// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tabbar/primeiraPagina.dart';
import 'package:tabbar/segundaPagina%20copy.dart';
import 'package:tabbar/terceiraPagina.dart';

void main() {
  runApp(const MaterialApp(
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controllerTabs;

  @override
  void initState() {
    super.initState();
    _controllerTabs = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abas"),
        bottom: TabBar(
          controller: _controllerTabs,
          tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            const Tab(
              text: "E-mail",
              icon: const Icon(Icons.email),
            ),
            const Tab(
              text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controllerTabs, children: [
        PrimeiraPagina(),
        SegundaPagina(),
        TerceiraPagina(),
      ]),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerTabs.dispose();
  }
}
