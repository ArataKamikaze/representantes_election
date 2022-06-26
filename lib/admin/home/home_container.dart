import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import '../../1_components/candidate_info.dart';
import '../../1_components/candidate_sumary.dart';
import 'home_controller.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({Key? key}) : super(key: key);

  var controller = HomeController();


  @override
  Widget build(BuildContext context) {
    List<Widget> candidates = [
       CandidateInfo(),
       CandidateSumary(),

    ];


    return Column(
      children: [
        SizedBox(
          height: 30,
          width: double.infinity,
          child: MoveWindow(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MinimizeWindowButton(colors: controller.buttonColors),
                MaximizeWindowButton(colors: controller.buttonColors),
                CloseWindowButton(colors: controller.buttonColors),
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
                      "Painel de Administração",
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
