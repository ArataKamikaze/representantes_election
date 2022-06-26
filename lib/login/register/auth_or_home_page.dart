import '../../aluno/main_page.dart';
import '../login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);


//Classe que retorna uma função que verifica se está autenticado, se estiver vai para a homepage, se não pede login.

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const HomePage() : const LoginPage();
  }
}
