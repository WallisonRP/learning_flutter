import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'model/anotacao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  var _db = AnotacaoHelper();

  _exibirTelaCadastro() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: "Título", hintText: "Digite o título..."),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      labelText: "Descrição",
                      hintText: "Digite a descrição..."),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              TextButton(
                  onPressed: () {
                    //salvar entrada do usuário+
                    _salvarAnotacao();
                  },
                  child: Text("Salvar"))
            ],
          );
        });
  }

  _salvarAnotacao() async {
    String title = _titleController.text;
    String description = _descriptionController.text;

    // print("Data atual: ${DateTime.now().toString()}");

    Anotacao anotacao = Anotacao(title, description, DateTime.now().toString());
    int resultado = await _db.salvarAnotacao(anotacao);
    print(resultado);

    _titleController.clear();
    _descriptionController.clear();
    // return resultado;
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();

    print("Lista anotações ${anotacoesRecuperadas}");
  }

  @override
  Widget build(BuildContext context) {
    _recuperarAnotacoes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Anotações"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
