/*import 'package:bitsdojo_window/bitsdojo_window.dart';*/
import 'package:eleicao_representante/app/modules/main/components/navigation_button.dart';
import 'package:eleicao_representante/app/modules/main/containers/home/home_container.dart';
import '../../components/button.dart';

import 'main_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentContainer = const HomeContainer();

  late var controller = MainController();

  setContainer(key) {
    setState(() {
      currentContainer = controller.setContainer(key);
    });
  }

// Apenas componentes visuais
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          SizedBox(
            width: 250,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://cdn.discordapp.com/attachments/684958105024331816/971485364218900551/Screenshot_19_6.png"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "e01066@academico.emge.edu.br",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Jost",
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            NavigationButton(
                              onPressed: () => setContainer("home"),
                              child: const Text(
                                "Inicio",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            
                            NavigationButton(
                              onPressed: () => setContainer("candidacy"),
                              child: const Text(
                                "Candidatar-se",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            
                            NavigationButton(
                              onPressed: () => setContainer("profile"),
                              child: const Text(
                                "Perfil",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MainButton(
                        onPressed: () {
                          Navigator.pop(context, '/AuthOrHomePage');
                        },
                        child: const Text("Inicio"),
                        isPrimary: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(child: currentContainer),
        ],
      ),
    );
  }
}
