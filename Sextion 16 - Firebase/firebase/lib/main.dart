// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth
      .instance; // objeto responsável por fazer a autenticação de usuários

  /* Criar usuário com e-mail e senha*/
  String email = "wallisonrp@gmail.com";
  String senha = "123456";

  // auth
  //     .createUserWithEmailAndPassword(email: email, password: senha)
  //     .then((firebaseUser) {
  //   print(
  //       "Sucesso ao criar um novo usuário, seu e-mail é: ${firebaseUser.user?.email}");
  // }).catchError((error) {
  //   print("Erro ao cadastrar usuário. Erro: ${error.toString()}");
  // });


  // Deslogar usuário
  auth.signOut();

  //Logar usuário
  // auth.signInWithEmailAndPassword(
  //   email: email, 
  //   password: senha
  //   ).then((firebaseUser){
  //     print(
  //       "Sucesso ao fazer login, seu e-mail é: ${firebaseUser.user?.email}");
  //   }).catchError((error){
  //     print("Erro ao fazer login. Erro: ${error.toString()}");
  //   });

  //Verificar se o usuário está logado

  User usuarioAtual = await auth.currentUser!;

  if (usuarioAtual != null) {
    //usuário logado
    print("Usuário logado, e-mail: ${usuarioAtual.email}");
  } else {
    // usuário deslogado
    print("Usuário deslogado");
  }
  
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
