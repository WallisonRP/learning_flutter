// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;

  // db.collection("usuarios").document("003").delete();

/*
  DocumentSnapshot snapshot =
      await db.collection("usuarios").document("002").get();


  var dados = snapshot.data;
  print("Nome: ${dados["nome"]}, idade: ${dados["idade"]}");
  */

  QuerySnapshot query = await db.collection("usuarios").getDocuments();

  // print("Dados usuários: ${query.documents.toString()}");

  for (DocumentSnapshot item in query.documents) {
    var dados = item.data;
    print("Dados usuários: ${dados["nome"]} - ${dados["idade"]}");
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
