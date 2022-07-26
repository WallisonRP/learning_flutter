import 'package:flutter/material.dart';

class TabAnimais extends StatefulWidget {
  const TabAnimais({Key? key}) : super(key: key);

  @override
  State<TabAnimais> createState() => _TabAnimaisState();
}

class _TabAnimaisState extends State<TabAnimais> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Animais"),);
  }
}
