import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();

  Firestore.instance
      .collection("usuarios")
      .document("pontuacao")
      .setData({"Wallison": "1215", "Gustavo": "100"});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
