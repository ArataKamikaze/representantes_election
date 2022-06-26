import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:eleicao_representante/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart' as firedart;

import '../../1_components/auth_form.dart';

class aRegisterPage extends fluent.StatefulWidget {
  const aRegisterPage({Key? key}) : super(key: key);

  @override
  fluent.State<aRegisterPage> createState() => _aRegisterPageState();
}

class _aRegisterPageState extends fluent.State<aRegisterPage> {
// APENAS TESTES
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    String? selectedId;

    firedart.CollectionReference testeCollection =
        firedart.Firestore.instance.collection('teste');

    Future<List<firedart.Document>> getTestes() async {
      List<firedart.Document> testes =
          await testeCollection.orderBy('name').get();

      return testes;
    }

    addTeste(String testeNome) async {
      await testeCollection.add({
        'name': testeNome,
      });
    }

    updateTeste(String testeName) async {
      await testeCollection.document(selectedId!).update(
        {'name': testeName},
      );
    }

    deleteTeste() async {
      await testeCollection.document(selectedId!).delete();
    }

    return fluent.FluentApp(
      home: Scaffold(
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
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-10.0),
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
                        color:
                            Theme.of(context).accentTextTheme.headline6?.color,
                      ),
                    ),
                  ),
                  const AuthForm(),
                  fluent.TextBox(
                    controller: textController,
                    placeholder: 'Add um nome de teste',
                  ),
                  fluent.Row(
                    children: [
                      fluent.Button(
                        child: const Text('Add'),
                        onPressed: () async {
                          await addTeste(textController.text);
                          setState(() {
                            textController.clear();
                          });
                        },
                      ),
                      fluent.Button(
                        child: const fluent.Text('Add'),
                        onPressed: () async {
                          await addTeste(textController.text);
                          setState(() {
                            textController.clear();
                          });
                        },
                      ),
                      fluent.Button(
                        child: const fluent.Text('Update'),
                        onPressed: () async {
                          await updateTeste(textController.text);
                          setState(() {
                            textController.clear();
                          });
                        },
                      ),
                      fluent.Button(
                          child: const fluent.Text('Delete'),
                          onPressed: () async {
                            await deleteTeste();
                            setState(() {
                              textController.clear();
                            });
                          })
                    ],
                  ),
                  FutureBuilder<List<firedart.Document>>(
                    future: getTestes(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<firedart.Document>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('Carregando...'),
                        );
                      }
                      return snapshot.data!.isEmpty
                          ? const Center(child: Text('Sem lista de testes'))
                          : SizedBox(
                              width: 500,
                              height: 200,
                              child: ListView(
                                scrollDirection: fluent.Axis.vertical,
                                children: snapshot.data!.map((teste) {
                                  return fluent.TappableListTile(
                                    title: Text(teste['name']),
                                    onTap: () {
                                      selectedId = teste.id;
                                      textController.text = teste['name'];
                                    },
                                  );
                                }).toList(),
                              ),
                            );
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
                          .document('zfyxccOXSU8zJgo4u6kY')
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
      ),
    );
  }
}
