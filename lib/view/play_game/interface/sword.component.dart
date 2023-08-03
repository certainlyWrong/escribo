import 'package:bonfire/bonfire.dart';

import 'status_bar.controller.dart';

class SwordComponent extends InterfaceComponent
    with UseStateController<StatusBarController> {
  SwordComponent(
      {required super.id, required super.position, required super.size})
      : super(
          spriteUnselected: Sprite.load(
            'sprites/lifeAndSword.png',
            srcSize: Vector2(16, 16),
          ),
        );
}
