// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuth auth = FirebaseAuth
      .instance; // objeto responsável por fazer a autenticação de usuários

  /* Criar usuário com e-mail e senha*/
  String email = "wallisonrp@gmail.com";
  String senha = "123456";

/*
  auth
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print(
        "Sucesso ao criar um novo usuário, seu e-mail é: ${firebaseUser.email}");
  }).catchError((error) {
    print("Erro ao cadastrar usuário. Erro: ${error.toString()}");
  });
  */

  //Verificar se o usuário está logado
  FirebaseUser usuarioAtual = await auth.currentUser();

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
