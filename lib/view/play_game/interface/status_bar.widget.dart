import 'dart:async' as asy;
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_tecnico_02/view/play_game/interface/status_bar.controller.dart';

class StatusBarWidget extends StatefulWidget {
  const StatusBarWidget({super.key});

  @override
  State<StatusBarWidget> createState() => _StatusBarWidgetState();
}

class _StatusBarWidgetState extends State<StatusBarWidget> {
  final ValueNotifier<String> _valueNotifier = ValueNotifier<String>('');
  bool stop = false;
  Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    stopwatch.start();

    asy.Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (stop) {
          timer.cancel();
        } else {
          _valueNotifier.value = stopwatch.elapsed.toString().substring(0, 7);
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    stopwatch.stop();

    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setString(
          'time',
          _valueNotifier.value,
        );
      },
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: StateControllerConsumer<StatusBarController>(
        builder: (context, controller) {
          controller.isFinish ? stop = true : stop = false;

          return Padding(
            padding: const EdgeInsets.only(left: 40, top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.sword}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        '${controller.life}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        '${controller.money}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<String>(
                  valueListenable: _valueNotifier,
                  builder: (context, value, child) => Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
