import 'package:flutter/material.dart';
import 'package:teste_tecnico_02/view/main_menu/main_menu.view.dart';
import 'package:teste_tecnico_02/view/play_game/play_game.view.dart';

void main() => runApp(const EscriboGame());

class EscriboGame extends StatelessWidget {
  const EscriboGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escribo Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenuView(),
        'play': (context) => const PlayGameView(),
      },
    );
  }
}
