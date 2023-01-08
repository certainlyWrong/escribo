import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  String? _time;

  @override
  void initState() {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          _time = prefs.getString('time');
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo: ${_time ?? 'Você não jogou ainda'}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
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
