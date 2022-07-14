// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
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
      body: Container(),
    );
  }
}
