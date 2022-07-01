import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../1_components/button.dart';
import '../../1_components/candidate_info.dart';
import '../../1_components/candidate_sumary.dart';
import 'package:firedart/firedart.dart' as firedart;

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  String selectedCandidate = "-1";
  int candidateCount = 5;
  /*List<Map<String, String>> candidates = [
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "bio":
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "motivacoes":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    },
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "bio":
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "motivacoes":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    },
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "bio":
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "motivacoes":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    },
  ];*/

  @override
  Widget build(BuildContext context) {
    firedart.CollectionReference candidatos =
        firedart.Firestore.instance.collection('candidaturas');

    Future<List<firedart.Document>> getCandidatos() async {
      List<firedart.Document> testes = await candidatos.orderBy('name').get();
      return testes;
    }

    final buttonColors = WindowButtonColors(
      iconNormal: Colors.white,
      mouseOver: const Color.fromARGB(36, 5, 5, 5),
      mouseDown: const Color.fromARGB(12, 0, 0, 0),
      iconMouseOver: const Color.fromARGB(255, 19, 80, 134),
      iconMouseDown: const Color.fromARGB(255, 255, 255, 255),
    );

    return Column(
      children: [
        SizedBox(
          height: 30,
          width: double.infinity,
          child: MoveWindow(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MinimizeWindowButton(colors: buttonColors),
                MaximizeWindowButton(colors: buttonColors),
                CloseWindowButton(colors: buttonColors),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
            
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                height: 60,
                width: double.infinity,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Eleições - 5º Período CC5NA",
                    style: TextStyle(color: Color(0xff6C757D), fontSize: 20),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xff6C757D),
                    )),
              ),
              const SizedBox(
                height: 65,
              ),
              Expanded(
                  child: Container(
                      child: Column(
                children: [
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(15),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Candidatos",
                        style: TextStyle(
                          color: Color(0xff6C757D),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder<List<firedart.Document>>(
                          future: getCandidatos(),
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<List<firedart.Document>> snapshot,
                          ) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: Text('Carregando...'),
                              );
                            }
                            return ListView(
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.map((candidates) {
                                return AnimatedCrossFade(
                                  secondChild: CandidateInfo(
                                    matricula: candidates["matricula"]!,
                                    name: candidates["name"]!,
                                    sala: candidates["sala"]!,
                                    bio: candidates["bio"]!,
                                    
                                    motivacoes: candidates["motivacoes"]!,
                                    onTap: () {
                                      setState(() {
                                        selectedCandidate = "-1";
                                      });
                                    },
                                  ),
                                  firstChild: CandidateSumary(
                                    matricula: candidates["matricula"]!,
                                    name: candidates["name"]!,
                                    sala: candidates["sala"]!,
                                    bio: candidates["bio"]!,
                                    
                                    onTap: () {
                                      setState(() {
                                        selectedCandidate = candidates.id;
                                      });
                                    },
                                  ),
                                  crossFadeState: (candidates.id == selectedCandidate)
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration: Duration(milliseconds: 300),
                                );
                              }).toList(),
                            );
                          }))
                ],
              )))
            ]),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff6C757D),
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MainButton(onPressed: () {}, child: const Text("Confirmar Voto"))
      ],
    );
  }
}
