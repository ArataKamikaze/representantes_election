import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class ProfileController{

  bool personalInfo = false;

  final buttonColors = WindowButtonColors(
      iconNormal: Colors.white,
      mouseOver: const Color.fromARGB(36, 5, 5, 5),
      mouseDown: const Color.fromARGB(12, 0, 0, 0),
      iconMouseOver: const Color.fromARGB(255, 19, 80, 134),
      iconMouseDown: const Color.fromARGB(255, 255, 255, 255),
    );
  
}