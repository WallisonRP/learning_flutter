// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Firestore db = Firestore.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

//Criar novo usuário
  // db
  // .collection("usuarios")
  // .doc("009")
  // .set({"nome": "Felipe", "idade": "19", "sobrenome": "Botelho"});

//Criar dados usando id aleatório
  // DocumentReference ref = await db.collection("noticias").add({
  //   "titulo": "Noticia de teste2",
  //   "descricao": "aaaaaaaaaaaaaaaaaaaaaa...."
  // });

  // print("Item salvo: ${ref.id}");

//Remover usuário
  // db.collection("usuarios").doc("003").delete();

//Listar usuário
  // DocumentSnapshot snapshot = await db.collection("usuarios").doc("001").get();
  // var dados = snapshot.data();
  // print(dados);

//Listar coleção de usuários
  // QuerySnapshot query = await db.collection("usuarios").get();

  // print("Dados usuários: ${query.docs.toString()}");

  //   for (DocumentSnapshot item in query.docs) {
  //   var dados = item.data;
  //   print(dados);
  // }

  //Aplicar filtros
  // var pesquisa = "mar";
  // QuerySnapshot querySnapshot = await db
  //     .collection("usuarios")
  //     // .where("nome", isEqualTo: "wallison")
  //     // .where("idade", isEqualTo: 23)
  //     // .where("idade", isLessThanOrEqualTo: 23)
  //     // .where("idade", isGreaterThan: 19)
  //     // .where("idade", isLessThan: 30)
  //     // .orderBy("idade",  descending: true)
  //     // .orderBy("nome",  descending: false)
  //     // .limit(2)

  //     .where("nome", isGreaterThanOrEqualTo: pesquisa)
  //     .where("nome", isLessThanOrEqualTo: "$pesquisa\uf8ff")
  //     .getDocuments(); //Pode ser utilizado o .snapshot().listen()

  // for (DocumentSnapshot item in querySnapshot.docs) {
  //   var dados = item.data;
  //   print("Filtro nome: ${dados['nome']} idade: ${dados['idade']}");
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
































/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  //inicializar o firebase
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imagem;
  String _statusUpload = "Upload não iniciado";
  String _urlImagemRecuperada = "";

  Future _recuperarImagem(bool daCamera) async {
    XFile? imagemSelecionada;
    if (daCamera == true) {
      //Recuperar imagem pela camera
      imagemSelecionada = await _picker.pickImage(source: ImageSource.camera);
    } else {
      //Recuperar imagem pela galeria
      imagemSelecionada = await _picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
  }

  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    //Fazer upload de imagens
    StorageUploadTask task = arquivo.putFile(File(_imagem!.path));

    //Controlar progresso do upload
    task.events.listen((StorageTaskEvent storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = "Upload concluído com sucesso!";
        });
      }
    });

    //Recuperar url da imagem
    task.onComplete.then((StorageTaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    print("A url da imagem é: $url");

    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_statusUpload),
            ElevatedButton(
                onPressed: () {
                  _recuperarImagem(true);
                },
                child: Text("Camera")),
            ElevatedButton(
                onPressed: () {
                  _recuperarImagem(false);
                },
                child: Text("Galeria")),

            _imagem == null 
            ? Container() 
            : Image.file(File(_imagem!.path)),

            _imagem == null 
            ? Container() 
            : ElevatedButton(
                onPressed: () {
                  _uploadImagem();
                },
                child: Text("Upload Storage")),

            _urlImagemRecuperada == "" 
            ? Container()
            : Image.network(_urlImagemRecuperada)
          ],
        ),
      ),
    );
  }
}

*/
