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
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(""),
            TextField(
              
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Salvar")),
                ElevatedButton(onPressed: (){}, child: Text("Ler")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
