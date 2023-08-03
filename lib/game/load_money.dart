import 'package:bonfire/bonfire.dart';

import 'load_player.dart';
import 'load_sprite_sheet.dart';

class Money extends GameDecoration with Sensor {
  final LoadSpriteSheet spriteSheet;
  final double tile;
  Money({
    required this.tile,
    required this.spriteSheet,
    required super.position,
    required super.size,
  }) : super.withAnimation(
          animation: spriteSheet.load(
            amount: 2,
            initPosition: Vector2(0, 0),
          ),
        );

  @override
  void onContact(GameComponent component) {
    if (component is LoadPlayer) {
      print('Pegou moeda');
      component.money = 1;
      removeFromParent();
    }
  }
}
