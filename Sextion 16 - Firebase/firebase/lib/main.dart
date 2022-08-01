// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;

  db.collection("usuarios")
    .document("002")
  .setData(
      {
        "nome": "Wallison",
        "idade": "23",
        "sobrenome": "Pereira"
      }
    );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
