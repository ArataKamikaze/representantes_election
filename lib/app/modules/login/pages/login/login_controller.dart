// ignore_for_file: constant_identifier_names

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../register/auth.dart';
import '../register/auth_exception.dart';

// Metodo para reconhecer se está no modo de registro ou login

enum AuthMode { Signup, Login }

// Login controller é a classe feita para as funções de login, para maior organização.

class LoginController {
  BuildContext context;
  LoginController(this.context);

// Validador de e-mail tanto para registro quanto para login
  final userController = TextEditingController();
  // ignore: prefer_function_declarations_over_variables
  String? Function(String?)? userValidator = (_email) {
    final email = _email ?? '';
    if (email.trim().isEmpty || !email.contains('@')) {
      return 'Informe um e-mail válido.';
    }
    return null;
  };
// Validador de senha tanto para registro quanto para login
  final passController = TextEditingController();
  // ignore: prefer_function_declarations_over_variables
  String? Function(String?)? passwordValidator = (_password) {
    final password = _password ?? '';
    if (password.isEmpty || password.length < 5) {
      return 'Informe uma senha válida';
    }
    return null;
  };
  // Verificação do tamanho do dispositivo para configurações gráficas
  late Size deviceSize = MediaQuery.of(context).size;

  final formKey = GlobalKey<FormState>();
// Variavel para reconhecimento de mudança de estado, espera de requisição http
  bool isLoading = false;

// Criação de objeto de autenticação
  AuthMode _authMode = AuthMode.Login;

// Mapa que recebe as informações do formulário tanto de login tanto de senha
  // ignore: prefer_final_fields
  Map<String, String> authData = {
    'email': '',
    'password': '',
  };

// Dois métodos que verificam o estado, sendo de registro ou login
  bool isLogin() => _authMode == AuthMode.Login;
  // ignore: unused_element
  bool _isSignup() => _authMode == AuthMode.Signup;


// Método para fazer a mudança de estado para login.
  // ignore: unused_element
  void _switchAuthMode() {
    if (isLogin()) {
      _authMode = AuthMode.Signup;
    } else {
      _authMode = AuthMode.Login;
    }
  }

// Tratamento de erro
  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ocorreu um erro'),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: const Text('Fechar'))
        ],
      ),
    );
  }

// Metodo de submite, verificando se o formulário é valido, mudando o estado para login, chamando um provider para tentar logar ou registrar, no fim tem um tratamento de erro.
  Future<void> submit() async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    isLoading = true;

    formKey.currentState?.save();

    Auth auth = Provider.of(context, listen: false);

    try {
      if (isLogin()) {
        //login
        await auth.login(
          authData['email']!,
          authData['password']!,
        );
      } else {
        //register
        await auth.signup(
          authData['email']!,
          authData['password']!,
        );
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    isLoading = false;
  }
// Cores padrões dos botões de login.
  final buttonColors = WindowButtonColors(
    iconNormal: Colors.white,
    mouseOver: const Color.fromARGB(36, 5, 5, 5),
    mouseDown: const Color.fromARGB(12, 0, 0, 0),
    iconMouseOver: const Color.fromARGB(255, 19, 80, 134),
    iconMouseDown: const Color.fromARGB(255, 255, 255, 255),
  );
}
