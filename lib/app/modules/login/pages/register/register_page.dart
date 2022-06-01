import 'dart:math';

import 'package:flutter/material.dart';

import '../../components/auth_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
// APENAS TESTES
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 70,
                  ),
                  transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Text(
                    'Eleição',
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Anton',
                      // ignore: deprecated_member_use
                      color: Theme.of(context).accentTextTheme.headline6?.color,
                    ),
                  ),
                ),
                const AuthForm(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, "/home");
                    },
                    child: const Text("volta"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
