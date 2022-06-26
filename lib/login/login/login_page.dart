/*import 'package:bitsdojo_window/bitsdojo_window.dart';*/
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import '../../1_components/button.dart';
import '../../1_components/input_field.dart';
import 'login_controller.dart';

// CLASSE PARA CRIAÇÃO DO FRONT-END

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;
// Iniciação do controller
  
  @override
  void initState() {
    controller = LoginController(context);
    super.initState();
  }
// Criação de um scaffold, widget de criação de tela padrão, depois tem a chamada de widgets do pack de widgets para personalização de aparência do windows
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
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
          // Todos widgets para criação de interface gráfica
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 50),
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  color: Colors.white,
                  height: 550,
                  width: 500,
                  child: Center(
                    child: /*Teste(),*/
                        Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("assets/images/logo.png")),
                          const SizedBox(height: 27),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Usuário:",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Chamada de um textfield componetizado que chama as funções do controller para autenticação
                          InputField(
                            context: context,
                            controller: controller.userController,
                            onSaved: (email) =>
                                controller.authData['email'] = email ?? '',
                            validator: controller.userValidator,
                            prefix: Icon(
                              Icons.perm_identity,
                              size: 20,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          const SizedBox(height: 27),
                          SizedBox(
                            width: double.infinity,
                            child: Text("Senha:",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                          ),
                          const SizedBox(height: 5),
                          // Chamada de um textfield componetizado que chama as funções do controller para autenticação
                          InputField(
                            context: context,
                            obscureText: true,
                            controller: controller.passController,
                            onSaved: (password) => controller
                                .authData['password'] = password ?? '',
                            validator: controller.passwordValidator,
                            prefix: Icon(
                              Icons.lock_outline,
                              size: 20,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Botoes componetizados, chamada de rota para mudança de tela dos aplicativos
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: const Text("Esqueci minha senha"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register2');
                                },
                                child: const Text("Register"),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          if (controller.isLoading)
                            const CircularProgressIndicator()
                          else
                            MainButton(onPressed: controller.submit, child: const Text("Login"))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
