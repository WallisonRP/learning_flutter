// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _randomNumber = 0;
  List _Frases = [
    "A certificação de metodologias que nos auxiliam a lidar com o entendimento das metas propostas representa uma abertura para a melhoria dos paradigmas corporativos.",
   "Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desenvolvimento contínuo de distintas formas de atuação obstaculiza a apreciação da importância das condições inegavelmente apropriadas.", 
   "A prática cotidiana prova que o julgamento imparcial das eventualidades garante a contribuição de um grupo importante na determinação do sistema de participação geral.", 
   "Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o fenômeno da Internet garante a contribuição de um grupo importante na determinação do remanejamento dos quadros funcionais.", 
   "Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se a constante divulgação das informações desafia a capacidade de equalização dos paradigmas corporativos.", 
   "Todavia, o acompanhamento das preferências de consumo cumpre um papel essencial na formulação das direções preferenciais no sentido do progresso.", 
   "Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade do investimento em reciclagem técnica.", 
   "Evidentemente, a complexidade dos estudos efetuados causa impacto indireto na reavaliação dos paradigmas corporativos.", 
   "O que temos que ter sempre em mente é que o acompanhamento das preferências de consumo faz parte de um processo de gerenciamento do investimento em reciclagem técnica.", 
   "Caros amigos, a contínua expansão de nossa atividade facilita a criação dos índices pretendidos."
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          // width: double.infinity,
          /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
        ),*/
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/logo.png"),
                Text(
                  _Frases[_randomNumber],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _randomNumber = new Random().nextInt(10);
                    setState(() {
                      print(_Frases[_randomNumber]);
                    });
                  },
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
