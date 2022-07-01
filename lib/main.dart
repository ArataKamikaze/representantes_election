import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'app.dart';
import 'package:firedart/firedart.dart' as firedart;
  
const apiKey = 'AIzaSyB6fzNGkR9Llmgy8oHOD6QkWMwClpvU0t4';
const projectId = 'eleicao-representante';

void main() async {
  firedart.Firestore.initialize(projectId);
  WidgetsFlutterBinding.ensureInitialized();

  
  await Window.initialize();
  runApp(const App());
  doWhenWindowReady(() {
    appWindow
      ..minSize = const Size(1150, 550)
      ..size = const Size(1150, 550)
      ..alignment = Alignment.center
      ..maximize()
      ..show();
  });
  await Window.setEffect(
    effect: WindowEffect.acrylic,
    color: const Color.fromARGB(50, 13, 38, 45),
  );
}
