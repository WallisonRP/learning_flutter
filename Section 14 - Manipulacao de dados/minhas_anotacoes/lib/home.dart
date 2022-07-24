import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'model/anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = <Anotacao>[];

  _exibirTelaCadastro({Anotacao? anotacao}) {
    String _textoSalvarAtualizar = "";
    if (anotacao == null) {
      //salvar
      _titleController.text = "";
      _descriptionController.text = "";
      _textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _titleController.text = anotacao.titulo!;
      _descriptionController.text = anotacao.descricao!;
      _textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$_textoSalvarAtualizar anotação"),
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
                    _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                    Navigator.pop(context);
                  },
                  child: Text(_textoSalvarAtualizar))
            ],
          );
        });
  }

  _salvarAtualizarAnotacao({Anotacao? anotacaoSelecionada}) async {
    String title = _titleController.text;
    String description = _descriptionController.text;

    // ignore: unnecessary_null_comparison
    if (anotacaoSelecionada == null) {
      //salvar
      Anotacao anotacao =
          Anotacao(title, description, DateTime.now().toString());
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      //atualizar
      anotacaoSelecionada.titulo = title;
      anotacaoSelecionada.descricao = description;
      anotacaoSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    _titleController.clear();
    _descriptionController.clear();

    _recuperarAnotacoes();
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    List<Anotacao>? listaTemporaria = <Anotacao>[];
    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }

    setState(() {
      _anotacoes = listaTemporaria!;
    });

    listaTemporaria = null;

    // print("Lista anotações $anotacoesRecuperadas");
  }

  _formatarData(String? data) {
    initializeDateFormatting("pt_BR");

    // var formater = DateFormat("d/M/y - H:m:s");
    var formater = DateFormat("d/MM/y - H:m:s");
    // var formater = DateFormat("d/MMM/y - H:m:s");
    // var formater = DateFormat("d/MMM/y - H:m:s");
    // var formater = DateFormat.yMd("pt_BR");

    DateTime dataConvertida = DateTime.parse(data!);
    String dataFormatada = formater.format(dataConvertida);

    return dataFormatada;
  }

  _removerAnotacao(int id) async {


    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Remover anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Deseja remover a anotação?", style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar")),
              TextButton(
                  onPressed: () async {
                    await _db.removerAnotacao(id);
                    Navigator.pop(context);
                  },
                  child: Text("Remover", style: TextStyle(color: Colors.red))
                  )
            ],
          );
        });

    _recuperarAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Anotações"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _anotacoes.length,
            itemBuilder: (context, index) {
              final anotacao = _anotacoes[index];

              return Card(
                child: ListTile(
                  title: Text(anotacao.titulo!),
                  subtitle: Text(
                      "${_formatarData(anotacao.data)} - ${anotacao.descricao}"),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    GestureDetector(
                      onTap: () {
                        _exibirTelaCadastro(anotacao: anotacao);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _removerAnotacao(anotacao.id!);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          ))
        ],
      ),
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
