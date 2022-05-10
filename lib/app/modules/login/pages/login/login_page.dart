/*import 'package:bitsdojo_window/bitsdojo_window.dart';*/
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';
import '../../../../components/input_field.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController();
  }

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
                child: MoveWindow(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MinimizeWindowButton(colors: controller.buttonColors),
                      MaximizeWindowButton(
                        colors: controller.buttonColors,
                      ),
                      CloseWindowButton(colors: controller.buttonColors),
                    ],
                  ),
                ),
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
                          EdgeInsets.symmetric(horizontal: 70, vertical: 70),
                      color: Colors.white,
                      height: 550,
                      width: 500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset("assets/images/logo.png")
                              ),
                            /*Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/logo.png"),
                                ),
                              ),
                            ),*/
                            SizedBox(height: 27),
                            Container(
                              width: double.infinity,
                              child: Text("Usuário:",style: TextStyle(color: Theme.of(context).colorScheme.secondary,),),
                            ),
                            SizedBox(height: 5),
                            InputField(
                              context: context,
                              controller: controller.userController,
                              prefix: Icon(
                                Icons.perm_identity,
                                size: 20,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            SizedBox(height: 27),
                            Container(
                              width: double.infinity,
                              child: Text("Senha:",style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
                            ),
                            SizedBox(height: 5),
                            InputField(
                              context: context,
                              obscureText: true,
                              controller: controller.passController,
                              prefix: Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
