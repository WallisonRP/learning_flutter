import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _estaMarcado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [
            /*
            Text("Receber notificações?"),
            Switch(
                value: _estaMarcado,
                onChanged: (bool escolha) {
                  setState(() {
                    _estaMarcado = escolha;
                  });
                }),
                  */

            SwitchListTile(
                title: Text("Receber notificações?"),
                subtitle: Text("Ao ativar, você receberá notificações"),
                value: _estaMarcado,
                onChanged: (bool escolha) {
                  setState(() {
                    _estaMarcado = escolha;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  if (_estaMarcado) {
                    print("Você ativou as notificações.");
                  } else {
                    print("Você desativou as notificações");
                  }
                },
                child: Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
