import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _lista = ["Maria", "João", "Amanda", "José"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _lista.length,
                  itemBuilder: (context, index) {
                    final item = _lista[index];

                    return Dismissible(
                        // direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          print("Direção: ${direction.toString()}");
                        },
                        key: Key(item),
                        child: ListTile(
                          title: Text(item),
                        ));
                  }))
        ],
      ),
    );
  }
}
