// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBancoDeDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);
      },
    );
    return bd;
    // print("aberto: ${bd.isOpen.toString()}");
  }

  _salvarNoBancoDeDados() async {
    Database bd = await _recuperarBancoDeDados();
    Map<String, dynamic> dadosUsuario = {"nome": "Guilherme Lima", "idade": 41};
    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id");
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDeDados();

    // String sql = "SELECT * FROM usuarios WHERE id = 6";
    // String sql = "SELECT * FROM usuarios WHERE idade = 23 OR idade = 41";
    // String sql = "SELECT * FROM usuarios WHERE nome = 'Pedro Luis' AND idade = 41";
    // String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 20 AND 41";
    // String sql = "SELECT * FROM usuarios WHERE idade IN (23,41)";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE 'Ester%'";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE 'E%' OR nome LIKE 'W%'";
    // String filtro = "on";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE '%$filtro%'";
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY nome ASC"; //ASC ou DESC;
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY idade ASC"; //ASC ou DESC;
    String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY idade ASC LIMIT 3"; //ASC ou DESC;
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY nome DESC"; //ASC ou DESC;
    // String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC";
    // String sql = "SELECT *, UPPER(nome) as nome2 FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) DESC"; 
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print(" id: ${usuario["id"]}" +
          " nome: ${usuario["nome"]}" +
          // " nome: ${usuario["nome2"]}" +
          " idade: ${usuario["idade"]}\n");
    }
    // print("Usuários: ${usuarios.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    _listarUsuarios();
    return Container();
  }
}
