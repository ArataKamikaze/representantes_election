import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../register/auth.dart';
import '../register/auth_exception.dart';

enum AuthMode { Signup, Login }

class LoginController {
  BuildContext context;
  LoginController(this.context);

  final userController = TextEditingController();
  String? Function(String?)? userValidator = (_email) {
    final email = _email ?? '';
    if (email.trim().isEmpty || !email.contains('@')) {
      return 'Informe um e-mail válido.';
    }
    return null;
  };

  final passController = TextEditingController();
  String? Function(String?)? passwordValidator = (_password) {
    final password = _password ?? '';
    if (password.isEmpty || password.length < 5) {
      return 'Informe uma senha válida';
    }
    return null;
  };
  late Size deviceSize = MediaQuery.of(context).size;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  AuthMode _authMode = AuthMode.Login;

  // ignore: prefer_final_fields
  Map<String, String> authData = {
    'email': '',
    'password': '',
  };

  bool isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  void _switchAuthMode() {
    if (isLogin()) {
      _authMode = AuthMode.Signup;
    } else {
      _authMode = AuthMode.Login;
    }
    ;
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ocorreu um erro'),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Text('Fechar'))
        ],
      ),
    );
  }

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

  final buttonColors = WindowButtonColors(
    iconNormal: Colors.white,
    mouseOver: const Color.fromARGB(36, 5, 5, 5),
    mouseDown: const Color.fromARGB(12, 0, 0, 0),
    iconMouseOver: const Color.fromARGB(255, 19, 80, 134),
    iconMouseDown: const Color.fromARGB(255, 255, 255, 255),
  );
}
