import 'package:http/http.dart' as http;
import 'dart:convert';

const chave_youtube_api = "AIzaSyA-5Cjm8x40ff5BwrojnpK_JuSO_QT-rLs";
const id_chanal = "UCrWvhVmt0Qac3HgsjQK62FQ";
const url_base = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse("${url_base}search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$chave_youtube_api"
        "&channelId=$id_chanal"
        "&q=$pesquisa"));

    if (response.statusCode == 200) {
      print("Até aqui tudo ok");
      Map<String, dynamic> dadosJson = json.decode(response.body);
      print("Resultado: ${dadosJson["items"][0]["snippet"]["title"]}");
    } else {
      print("Error");
    }
  }
}
