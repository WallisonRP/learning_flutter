// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;

  QuerySnapshot querySnapshot = await db.collection("usuarios")
  // .where("nome", isEqualTo: "wallison")
  // .where("idade", isEqualTo: 23)
  // .where("idade", isLessThanOrEqualTo: 23)
  .where("idade", isGreaterThan: 19)
  // .where("idade", isLessThan: 30)
  .orderBy("idade",  descending: true)
  .orderBy("nome",  descending: false)
  .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print("Filtro nome: ${dados['nome']} idade: ${dados['idade']}");
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
