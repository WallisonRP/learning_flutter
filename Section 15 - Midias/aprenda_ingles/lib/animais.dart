import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
class TabAnimais extends StatefulWidget {
  const TabAnimais({Key? key}) : super(key: key);

  @override
  State<TabAnimais> createState() => _TabAnimaisState();
}

class _TabAnimaisState extends State<TabAnimais> {

  _executarAudio(String nomeAudio) async {
    Audio.load('assets/sounds/$nomeAudio.mp3')..play()..dispose();
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: [
        GestureDetector(
          onTap: () {
            _executarAudio("cao");
          },
          child: Image.asset("assets/images/cao.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("gato");
          },
          child: Image.asset("assets/images/gato.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("leao");
          },
          child: Image.asset("assets/images/leao.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("macaco");
          },
          child: Image.asset("assets/images/macaco.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("ovelha");
          },
          child: Image.asset("assets/images/ovelha.png"),
        ),
        GestureDetector(
          onTap: () {
            _executarAudio("vaca");
          },
          child: Image.asset("assets/images/vaca.png"),
        ),
      ],
    );
  }
}
