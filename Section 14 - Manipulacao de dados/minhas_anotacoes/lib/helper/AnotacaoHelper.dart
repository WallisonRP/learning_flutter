import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/anotacao.dart';

class AnotacaoHelper {
  static const String nomeTabelaAnotacoes = "anotacoes";
  static const String colunaId = "id";
  static const String colunaTitulo = "titulo";
  static const String colunaDescricao = "descricao";
  static const String colunaData = "data";

  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();

  Database? _db;

  factory AnotacaoHelper() {
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal();

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabelaAnotacoes ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "titulo VARCHAR, "
        "descricao TEXT, "
        "data DATETIME)";
    db.execute(sql);
  }

  inicializarDB() async {
    final caminhoDB = await getDatabasesPath();
    final localDB = join(caminhoDB, "banco_minhas_anotacoes.db");

    var db = await openDatabase(localDB, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    int resultado =
        await bancoDados.insert(nomeTabelaAnotacoes, anotacao.toMap());
    return resultado;
  }

  recuperarAnotacoes() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabelaAnotacoes ORDER BY data DESC";
    List anotacoes = await bancoDados.rawQuery(sql); 
    return anotacoes;
  }
}
