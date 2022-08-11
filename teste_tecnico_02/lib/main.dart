import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:teste_tecnico_02/view/main_menu/main_menu.view.dart';
import 'package:teste_tecnico_02/view/play_game/play_game.view.dart';

void main() {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  runApp(const EscriboGame(tile: 16));
}

class EscriboGame extends StatelessWidget {
  // The tile size is used to set the size of the tiles in the map
  final double tile;

  const EscriboGame({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escribo Game',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/play',
      routes: {
        '/': (context) => const MainMenuView(),
        '/play': (context) => PlayGameView(tile: tile),
      },
    );
  }
}
