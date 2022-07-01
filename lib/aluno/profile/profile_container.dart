import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:eleicao_representante/1_components/profile_old_elections.dart';
import 'package:flutter/material.dart';
import '../../1_components/button.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  bool personalInfo = false;
  bool electionInfo = false;

  List<Map<String, String>> oldCandidates = [
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "ano": "2020",
      "semestre": "1",
    },
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "ano": "2020",
      "semestre": "1",
    },
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "ano": "2020",
      "semestre": "1",
    },
    {
      "matricula": "E01010",
      "name": "Jeremy Elbertson",
      "sala": "CC4MA",
      "image":
          "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg",
      "ano": "2020",
      "semestre": "1",
    },
  ];

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
                                    "Eleições anteriores",
                                    style: TextStyle(
                                        color: Color(0xff6C757D), fontSize: 20),
                                  ),
                                  Icon(!electionInfo
                                      ? Icons.chevron_right
                                      : Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                        ),
                        !electionInfo
                            ? Container()
                            : Column(
                              children: [
                                ListView.builder(
                                  itemCount: oldCandidates.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ProfileOldElections(
                                      ano: oldCandidates[index]["ano"]!,
                                      semestre: oldCandidates[index]["semestre"]!,
                                      matricula: oldCandidates[index]["matricula"]!,
                                      name: oldCandidates[index]["name"]!,
                                      sala: oldCandidates[index]["sala"]!);                                
                                  }
                                )
                              ],
                            )
                      ],
                    ),
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
