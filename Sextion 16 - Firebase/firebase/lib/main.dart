import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  //inicializar o firebase
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child("fotos").child("foto2.jpg");
    //Fazer upload de imagens
    UploadTask task = arquivo.putFile(File(_imagem!.path));
    //Controlar progresso do upload
    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      if (taskSnapshot.state == TaskState.running) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (taskSnapshot.state == TaskState.success) {
        _recuperarUrlImagem(taskSnapshot);
        setState(() {
          _statusUpload = "Upload concluído com sucesso!";
        });
      }
    });
    //Recuperar url da imagem
    // task.onComplete.then((StorageTaskSnapshot snapshot) {
    //   _recuperarUrlImagem(snapshot);
    // });
  }

  Future _recuperarUrlImagem(TaskSnapshot taskSnapshot) async {
    String url = await taskSnapshot.ref.getDownloadURL();
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
            _imagem == null ? Container() : Image.file(File(_imagem!.path)),
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
