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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: FutureBuilder<List<Post>>(
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
                  print("Lista: Carregada com sucesso!");
                  return ListView.builder(
                    itemCount: snapshop.data?.length,
                    itemBuilder: (context, index) {
                      List<Post>? lista = snapshop.data;
                      Post post = lista![index];


                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.id.toString()),
                      );
                    },
                  );
                }
                break;
            }
            return Center();
          }),
    );
  }
}
