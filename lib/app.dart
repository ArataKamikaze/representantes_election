import 'package:eleicao_representante/login/register/aregister_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin/admin_page.dart';
import 'aluno/candidacy/candidacy_container.dart';
import 'aluno/main_page.dart';
import 'login/register/auth.dart';
import 'login/register/auth_or_home_page.dart';
import 'login/register/register_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: "Eleição de representantes",
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff135086),
            onPrimary: Color(0xFFFFFFFF),
            secondary: Color(0xFF6C757D),
            onSecondary: Color(0xFFFFFFFF),
            error: Color(0xffF9002D),
            onError: Color(0xFFFFFFFF),
            background: Color(0xffF9FAFC),
            onBackground: Color(0xff6C757D),
            surface: Color(0xFFEDEDED),
            onSurface: Color(0xFF6C757D),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const AuthOrHomePage(),
          "/register": (context) => RegisterPage(),
          "/home": (context) => const HomePage(),
          "/adminPage": (context) => const AdminPage(),
          "/teste": (context) => const aRegisterPage(),
        },
      ),
    );
  }
}
