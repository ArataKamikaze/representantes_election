import 'dart:math';

import 'package:flutter/material.dart';
import 'package:eleicao_representante/app/app.dart';
import '../../components/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart' as firedart;

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
// APENAS TESTES
  @override
  Widget build(BuildContext context) {
    firedart.CollectionReference testeCollection =
        firedart.Firestore.instance.collection('teste');

    Future<List<firedart.Document>> getTestes() async {
      List<firedart.Document> testes =
          await testeCollection.orderBy('name').get();

      return testes;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 70,
                  ),
                  transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Text(
                    'Eleição',
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Anton',
                      // ignore: deprecated_member_use
                      color: Theme.of(context).accentTextTheme.headline6?.color,
                    ),
                  ),
                ),
                const AuthForm(),
                FutureBuilder<List<firedart.Document>>(
                  future: getTestes(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<firedart.Document>> snapshot) {
                    return const Text('Placeholder');
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    final testes = await testeCollection.get();
                    print(testes);
                  },
                  child: const Text("Lista teste"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await testeCollection.add({'name': 'victor'});
                  },
                  child: const Text("Adicionar a lista teste"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await testeCollection
                        .document('EAixG8b9K2cHaFARxllF')
                        .update({'name': 'corno'});
                  },
                  child: const Text("Editar a lista teste"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await testeCollection
                        .document('EAixG8b9K2cHaFARxllF')
                        .delete();
                  },
                  child: const Text("Deletar um elemento da lista teste"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, '/AuthOrHomePage');
                  },
                  child: const Text('VOLTAR TELA INICIAL'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
