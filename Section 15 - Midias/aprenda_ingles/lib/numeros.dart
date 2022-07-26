import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

class TabNumeros extends StatefulWidget {
  const TabNumeros({Key? key}) : super(key: key);

  @override
  State<TabNumeros> createState() => _TabNumerosState();
}

class _TabNumerosState extends State<TabNumeros> {

  _executarAudio(String nomeAudio) async {
    Audio.load('assets/sounds/$nomeAudio.mp3')..play()..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: [
        GestureDetector(
          onTap: () {
            _executarAudio("1");
          },
          child: Image.asset("assets/images/1.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("2");
          },
          child: Image.asset("assets/images/2.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("3");
          },
          child: Image.asset("assets/images/3.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("4");
          },
          child: Image.asset("assets/images/4.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("5");
          },
          child: Image.asset("assets/images/5.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("6");
          },
          child: Image.asset("assets/images/6.png"),
        ),
      ],
    );
    
  }
}