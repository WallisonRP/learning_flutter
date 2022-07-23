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
    Map<String, dynamic> dadosUsuario = {"nome": "Pedro Luis", "idade": 19};
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
    String sql = "SELECT * FROM usuarios"; //ASC ou DESC;
    // String sql =
    //     "SELECT * FROM usuarios WHERE 1=1 ORDER BY idade ASC LIMIT 3"; //ASC ou DESC;
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

  _recuperarUsuarioPeloId(int id) async {
    Database bd = await _recuperarBancoDeDados();

    //CRUD -> Create, Read, Update and Delete
    List usuarios = await bd.query("usuarios",
        columns: ["id", "nome", "idade"], where: "id = ?", whereArgs: [id]);

    for (var usuario in usuarios) {
      print(" id: ${usuario["id"]}" +
          " nome: ${usuario["nome"]}" +
          // " nome: ${usuario["nome2"]}" +
          " idade: ${usuario["idade"]}\n");
    }
  }

  _deletarUsuario(int id) async {
    Database bd = await _recuperarBancoDeDados();

    //Caso seja executado sem condições, todos os registros da tabela, serão apagados

    // Future retorno = bd.delete("usuarios", where: "id = ?", whereArgs: [id]);

    // int retorno = await bd.delete("usuarios",
    //     where: "id = ? AND nome = ? AND idade = ?",
    //     whereArgs: [id, "Ester Figueiredo", 24]);

    int retorno = await bd.delete("usuarios",
        where: "nome = ? AND idade = ?",
        whereArgs: ["Guilherme Crisostomo", 19]);

    print("Quantidade de itens removidos: $retorno");
  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDeDados();
    //Caso seja executado sem condições, todos os registros da tabela, serão alterados
    Map<String, dynamic> dadosUsuario = {
      "nome": "Wallison Franklin",
      "idade": 24
    };

    int retorno = await bd.update(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
      dadosUsuario,
    );
    print("Quantidade de itens alterados: $retorno");
  }

  @override
  Widget build(BuildContext context) {
    // _salvarNoBancoDeDados();
    // _recuperarUsuarioPeloId(7);
    // _deletarUsuario(3);
    // _atualizarUsuario(4);
    _listarUsuarios();
    return Container();
  }
}
