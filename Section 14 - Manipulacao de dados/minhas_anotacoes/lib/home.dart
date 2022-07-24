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

    print("Lista anotações $anotacoesRecuperadas");
  }

  _formatarData(String? data) {
    initializeDateFormatting("pt_BR");

    // var formater = DateFormat("d/M/y - H:m:s");
    // var formater = DateFormat("d/MM/y - H:m:s");
    // var formater = DateFormat("d/MMM/y - H:m:s");
    // var formater = DateFormat("d/MMM/y - H:m:s");
    var formater = DateFormat.yMd("pt_BR");

    DateTime dataConvertida = DateTime.parse(data!);
    String dataFormatada = formater.format(dataConvertida);

    return dataFormatada;
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
