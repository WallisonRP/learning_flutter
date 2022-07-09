import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  const AlcoolOuGasolina({Key? key}) : super(key: key);

  @override
  State<AlcoolOuGasolina> createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina")
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Image.asset("images/logo.png"),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Saiba qual a melhor opção para abastecer seu carro",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Alcool, ex: 3,60",
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Gasolina, ex: 3,60",
            ),
          ),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              
            ),
            child: Text("Calcular")
            )
      ]),
      ),
    );
  }
}
