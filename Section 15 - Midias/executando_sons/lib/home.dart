import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final player = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");

  _executarAudio() async {
    await player.setSource(AssetSource('audios/musica.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("teste")),
      body: Container(
        child: ElevatedButton(onPressed: _executarAudio, child: Text("Teste")),
      ),
    );
  }
}
