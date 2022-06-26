import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../1_components/button.dart';
import '../../1_components/candidate_header.dart';
import '../../1_components/input_field.dart';


class CandidacyContainer extends StatelessWidget {
  CandidacyContainer({Key? key}) : super(key: key);
  

  //variáveis para db\\
  var bioController = new TextEditingController();
  var motivationController = new TextEditingController();
  List<String> date = ["25/06", "25/07"];
  var name = "Jeremy Elbertson";
  var matricula = "E00110";
  var sala = "CC4MA";

  //variaveis para db\\

  @override
  Widget build(BuildContext context) {
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
            color: const Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Formulário de Candidatura ${date[0]} até ${date[1]}",
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
                  height: 35,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        CandidateHeader(name: name,matricula: matricula,sala: sala,),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text("Escreva um pouco sobre você"),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: InputField(
                                  context: context,
                                  controller: bioController,
                                  isTextArea: true,
                                )),
                                SizedBox(height: 30,),
                                Text(
                                    "Para efetivar a sua candidatura à representante, apresente brevemente as suas motivações"),
                                    SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: InputField(
                                    context: context,
                                    controller: motivationController,
                                    isTextArea: true,
                                  ),
                                ),
                                SizedBox(height: 50,),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MainButton(
                        onPressed: () {},
                        child: const Text("Confirmar Candidatura")),
                    MainButton(onPressed: () {}, child: const Text("Cancelar")),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
