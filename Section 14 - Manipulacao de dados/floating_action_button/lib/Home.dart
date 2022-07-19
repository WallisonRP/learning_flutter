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
        title: Text("FloatingActionButton"),
      ),
      body: Text("Conteudo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 6,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(0)
        // ),
        onPressed: (){},
        /*child: Icon(Icons.add),
        onPressed: () {
        print("Resultado: Botão pressionado");
      }*/),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: ((){}), icon: Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
