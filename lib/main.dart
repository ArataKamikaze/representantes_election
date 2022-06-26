import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'app/app.dart';
import 'package:fluent_ui/fluent_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  runApp(const App());
  doWhenWindowReady(() {
    appWindow
      ..minSize = const Size(640, 360)
      ..size = const Size(720, 540)
      ..alignment = Alignment.center
      ..maximize()
      ..show();
  });
  await Window.setEffect(
    effect: WindowEffect.acrylic,
    color: const Color.fromARGB(50, 13, 38, 45),
  );
}
