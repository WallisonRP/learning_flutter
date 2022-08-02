// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;

  /*db.collection("usuarios")
    .document("002")
  .setData(
      {
        "nome": "Wallison",
        "idade": "23",
        "sobrenome": "Pereira"
      }
    );*/
  /*
  DocumentReference ref = await db.collection("noticias").add({
    "titulo": "Noticia de teste2",
    "descricao": "aaaaaaaaaaaaaaaaaaaaaa...."
  });

  print("Item salvo: ${ref.documentID}");
  */

  db.collection("noticias").document("lpwXXznCoG3o5JeA5ou2").setData(
    {
      "titulo": "Noticia alterada",
      "descricao": "aaaaaaaaaaaaaaaaaaaaaa...."
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
