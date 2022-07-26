import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/video.dart';

const chave_youtube_api = "AIzaSyA-5Cjm8x40ff5BwrojnpK_JuSO_QT-rLs";
const id_chanal = "UCrWvhVmt0Qac3HgsjQK62FQ";
const url_base = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>>? pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse("${url_base}search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$chave_youtube_api"
        "&channelId=$id_chanal"
        "&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        // return Video.converterJson(map);
      }).toList();

      return videos;

      /*
      for (var video in dadosJson["items"]) {
        print("Resultado: ${video.toString()}");
      }
      */

      // print("Resultado: ${dadosJson["items"][0]["snippet"]["title"]}");
    } else {
      print("Error");
    }
  }
}
