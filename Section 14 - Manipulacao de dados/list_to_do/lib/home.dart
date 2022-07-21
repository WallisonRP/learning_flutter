// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });

    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Widget _criarItemLista(context, index) {
    final item = _listaTarefas[index]["titulo"];

    return Dismissible(
        key: Key(item),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          //recuperar último item excluido

          //Remove itens da lista
          _listaTarefas.removeAt(index);
          // _salvarArquivo();

          //snackbar
          final snackbar = SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
            padding: EdgeInsets.all(14),
            content: Text("Tarefa removida com sucesso!", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
            );
          
          Scaffold.of(context).showSnackBar(snackbar);
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
        child: CheckboxListTile(
          title: Text(_listaTarefas[index]["titulo"]),
          value: _listaTarefas[index]["realizada"],
          onChanged: (valorAlterado) {
            setState(() {
              _listaTarefas[index]["realizada"] = valorAlterado;
            });
            _salvarArquivo();
          },
        ));

    /*
                return ListTile(
                  title: Text(_listaTarefas[index]["titulo"]),
                );
                */
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("Itens: ${_listaTarefas.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(labelText: "Digite sua tarefa"),
                    onChanged: (text) {},
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: () {
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                        child: Text("Salvar"))
                  ],
                );
              });
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: _criarItemLista,
            ),
          )
        ],
      ),
    );
  }
}
