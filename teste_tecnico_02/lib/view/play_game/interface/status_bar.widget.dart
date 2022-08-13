import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_02/view/play_game/interface/status_bar.controller.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: StateControllerConsumer<StatusBarController>(
        builder: (context, controller) => Padding(
          padding: const EdgeInsets.only(left: 40, top: 70),
          child: SizedBox(
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
        ),
      ),
    );
  }
}
