import 'package:eleicao_representante/app/modules/login/pages/login/login_page.dart';
import 'package:eleicao_representante/app/modules/login/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/pages/home/home_page.dart';
import 'auth.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? HomePage() : LoginPage();
  }
}
