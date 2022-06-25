import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../../../components/button.dart';
import '../../components/candidate_info.dart';
import '../../components/candidate_sumary.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  bool personalInfo = false;
  bool electionInfo = false;

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
            color: const Color(0xFFf9fafc),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Perfil do usuário",
                      style: TextStyle(color: Color(0xff6C757D), fontSize: 20),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xff6C757D),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () =>
                              setState(() => personalInfo = !personalInfo),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Informações pessoais",
                                    style: TextStyle(
                                        color: Color(0xff6C757D), fontSize: 20),
                                  ),
                                  Icon(!personalInfo
                                      ? Icons.chevron_right
                                      : Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                        ),
                        !personalInfo
                            ? Container()
                            : Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text("Matrícula:"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("E00001")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: const [
                                      Text("Nome:"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("ArataKamikaze da Cunha")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: const [
                                      Text("E-mail"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          "ArataKamikaze.da.cunha420.69@electronicMail.com")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  MainButton(
                                      onPressed: () {},
                                      child: const Text("Alterar Senha"))
                                ],
                              ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () =>
                              setState(() => electionInfo = !electionInfo),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
