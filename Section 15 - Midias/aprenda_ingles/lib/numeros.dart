import 'package:flutter/material.dart';

class TabNumeros extends StatefulWidget {
  const TabNumeros({Key? key}) : super(key: key);

  @override
  State<TabNumeros> createState() => _TabNumerosState();
}

class _TabNumerosState extends State<TabNumeros> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Animais"),);
    
  }
}