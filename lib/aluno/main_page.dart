import '../1_components/button.dart';
import '../1_components/navigation_button.dart';
import 'home/home_container.dart';
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

  //variáveis para db\\
    var imgUrl = "https://cdn.discordapp.com/attachments/853795302388662302/992523892356829315/avatar-0484d1625a1c619bacf85f51f872f85b.jpg";
    var email = "e01010@academico.emge.edu.br";
  //variáveis para db\\

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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              imgUrl),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      email,
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
                      
                      /*MainButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/adminPage');
                        },
                        child: const Text("admin"),
                        isPrimary: false,
                      ),*/
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
