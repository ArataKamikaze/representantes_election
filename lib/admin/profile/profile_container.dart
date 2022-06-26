import 'package:bitsdojo_window/bitsdojo_window.dart';
import '../../1_components/button.dart';
import 'profile_controller.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatefulWidget {
  var name = "Jeremy Elbertson";
  var matricula = "E00110";
  var email = "CC4MA";


  ProfileContainer({
    Key? key,
    this.name = "Jeremy Elbertson",
    this.matricula = "E00110",
    this.email = "teste@admin.emge.edu.br",
  }) : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  
  var controller = ProfileController();
  
  @override
  Widget build(BuildContext context) {

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
                              setState(() => controller.personalInfo = !controller.personalInfo),
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
                                  Icon(!controller.personalInfo
                                      ? Icons.chevron_right
                                      : Icons.expand_more)
                                ],
                              ),
                            ),
                          ),
                        ),
                        !controller.personalInfo
                            ? Container()
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Matrícula:"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(widget.matricula),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text("Nome:"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(widget.name)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text("E-mail"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          widget.email)
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
