import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/login/pages/login/login_page.dart';
import 'modules/login/pages/register/auth.dart';
import 'modules/home/pages/home/home_page.dart';
import 'modules/login/pages/register/register_page.dart';

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
          primarySwatch: Colors.blue,
          backgroundColor: Colors.red,
        ),
        initialRoute: "/",
        routes: {
          "/":(context) => LoginPage(),
          "/home": (context) => HomePage(),
          "/register": (context) => RegisterPage(),
        },
      ),
    );
  }
}
