import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  late AudioPlayer audioPlayer;

  void permissionSound() async {
    Future.delayed(const Duration(seconds: 2), () async {
      audioPlayer = AudioPlayer();

      List<String> aux = [
        'assets/sounds/background1.mp3',
        'assets/sounds/background2.mp3',
        'assets/sounds/background3.mp3',
      ];

      audioPlayer.setLoopMode(LoopMode.one);
      audioPlayer.setAsset(aux[Random().nextInt(aux.length)]);
      await audioPlayer.play();
    });
  }

  @override
  void initState() {
    permissionSound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 40,
              child: FloatingActionButton(
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil('/play', (route) => false),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow),
                    Text('Play'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
