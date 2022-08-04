// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            _imagem == null ?
            Container() :
            Image.file(File(_imagem!.path))
          ],
        ),
      ),
    );
  }
}
