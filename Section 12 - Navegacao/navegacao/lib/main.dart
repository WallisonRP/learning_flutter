// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'TelaSecundaria.dart';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: ((context) => TelaSecundaria())
                )
                );
              }, 
              child: Text("Ir para segunda tela"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15)
              ),
              
              )
          ],
        ),
      ),
    );
  }
}
