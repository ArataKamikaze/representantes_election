/*import 'package:bitsdojo_window/bitsdojo_window.dart';*/
import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var theme = ThemeData(
    primaryColor: const Color.fromARGB(255, 19, 80, 134),
    backgroundColor: const Color(0xFFF9FAFC),
  );
/*
  final buttonColors = WindowButtonColors(
    iconNormal: Colors.white,
    mouseOver: const Color.fromARGB(36, 5, 5, 5),
    mouseDown: const Color.fromARGB(12, 0, 0, 0),
    iconMouseOver: const Color.fromARGB(255, 19, 80, 134),
    iconMouseDown: const Color.fromARGB(255, 255, 255, 255),
  );
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                height: 30,
                /*child: MoveWindow(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MinimizeWindowButton(colors: buttonColors),
                      MaximizeWindowButton(
                        colors: buttonColors,
                      ),
                      CloseWindowButton(colors: buttonColors),
                    ],
                  ),
                ),*/
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Seja bem vindo à",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                    )
                                  ]),
                            ),
                            Text(
                              "Eleição de representantes",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: "Outfit",
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                      color: Colors.white,
                      height: 600,
                      width: 500,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://cdn.discordapp.com/attachments/585265336874696717/969649503676280882/Screenshot_14_2.png"),
                              ),
                            ),
                          ),
                          TextField(),
                          TextField(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Esqueci minha senha"),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text("Register"))
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: Text("Login"))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
