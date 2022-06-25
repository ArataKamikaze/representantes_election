import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../../../components/button.dart';
import '../../components/candidate_info.dart';
import '../../components/candidate_sumary.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> candidates = [
       CandidateInfo(),
       CandidateSumary(),
       CandidateSumary(),
       CandidateSumary(),
       CandidateSumary(),
       CandidateSumary(),
       CandidateSumary(),
       CandidateSumary(),
       CandidateSumary(),
    ];


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
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
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
                            child: ListView.builder(
                                itemCount: candidates.length,
                                itemBuilder: (context, index) {
                                  return candidates[index];
                                }))
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
                MainButton(onPressed: () {}, child: const Text("Confirmar Voto"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
