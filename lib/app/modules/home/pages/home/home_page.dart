/*import 'package:bitsdojo_window/bitsdojo_window.dart';*/
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../../components/sidebar.dart';
import 'home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();
  
  var theme = ThemeData(
    primaryColor: const Color.fromARGB(255, 19, 80, 134),
    backgroundColor: const Color(0xFFF9FAFC),
  );

  final buttonColors = WindowButtonColors(
    iconNormal:            Colors.white,
    mouseOver:     const Color.fromARGB(36, 5, 5, 5),
    mouseDown:     const Color.fromARGB(12, 0, 0, 0),
    iconMouseOver: const Color.fromARGB(255, 19, 80, 134),
    iconMouseDown: const Color.fromARGB(255, 255, 255, 255),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
            children: [
              Container(
                width: 250,
                height: double.infinity,
                child: SideBar(),
              ),
              Expanded(
                  child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      width: double.infinity,
                      child: MoveWindow(child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MinimizeWindowButton(colors: buttonColors),
                          MaximizeWindowButton(colors: buttonColors,),
                          CloseWindowButton(colors: buttonColors),
                        ],
                      ),
                      )
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 80,vertical: 50),
                        color: Color(0xFFFFFFFF),
                        child: Icon(Icons.abc),
                      ),
                    ),
                  ],
              ))
            ],
          ),
        );
  }
}
