// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aprenda_ingles/animais.dart';
import 'package:aprenda_ingles/numeros.dart';
import 'package:aprenda_ingles/vogais.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff795548),
        title: Text("Apenda inglês"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController, 
          tabs: [
          Tab(
            text: "Animais",
          ),
          Tab(
            text: "Números",
          ),
          Tab(
            text: "Vogais",
          ),
        ]),
      ),
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: [
            TabAnimais(),
            TabNumeros(),
            TabVogais(),
          ]
          ),
      )
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
}
