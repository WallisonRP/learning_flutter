// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Post.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse("${_urlBase}/posts"));
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      // print("post: " + post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  _post() async {
    Post post = Post(120, null, "Titulo", "Corpo da postagem");

    var corpo = json.encode(
      post.toJson()
    );
    http.Response response = await http.post(
      Uri.parse("${_urlBase}/posts"),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _put() async {
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": "Titulo alterado",
      "body": "Corpo da postagem alterado"
    });
    http.Response response = await http.put(
      Uri.parse("${_urlBase}/posts/2"),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _patch() async {
    var corpo =
        json.encode({"userId": 120, "body": "Corpo da postagem alterado"});
    http.Response response = await http.patch(
      Uri.parse("${_urlBase}/posts/2"),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _delete() async {
    http.Response response =
        await http.delete(Uri.parse("${_urlBase}/posts/2"));

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: _post, child: Text("Salvar")),
                ElevatedButton(onPressed: _patch, child: Text("Atualizar")),
                ElevatedButton(onPressed: _delete, child: Text("Deletar"))
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshop) {
                    switch (snapshop.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        print("Conexão done");
                        if (snapshop.hasError) {
                          print("Lista: Erro ao carregar");
                        } else {
                          return ListView.builder(
                            itemCount: snapshop.data?.length,
                            itemBuilder: (context, index) {
                              List<Post>? lista = snapshop.data;
                              Post post = lista![index];

                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.retornoId.toString()),
                              );
                            },
                          );
                        }
                        break;
                    }
                    return Center();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
