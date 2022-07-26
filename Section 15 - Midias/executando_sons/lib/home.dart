import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer player = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double _volume = 0.5;

  _carregarAudio() async {
    player.setVolume(_volume);
    await player.setSource(AssetSource("audios/musica.mp3"));
  }

  _executarAudio() async {
    await player.resume();
  }

  _pausarAudio() async {
    await player.pause();
  }

  _pararAudio() async {
    await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    _carregarAudio();
    return Scaffold(
      appBar: AppBar(title: Text("teste")),
      body: Column(
        children: [
          Slider(
              value: _volume,
              min: 0,
              max: 1,
              onChanged: (novoVolume) async {
                setState(() {
                  _volume = novoVolume;
                });

                player.setVolume(novoVolume);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //item 1
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: () {
                    _executarAudio();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: () {
                    _pausarAudio();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: () {
                    _pararAudio();
                  },
                ),
              )
              //item 2
              //item 3
            ],
          )
        ],
      ),
    );
  }
}
