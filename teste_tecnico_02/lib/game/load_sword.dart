import 'load_player.dart';
import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02/game/load_sprite_sheet.dart';

enum SwordType {
  life,
  death,
}

class Potion extends GameDecoration with Sensor {
  final double tile;
  final int spriteSword;
  final LoadSpriteSheet spriteSheet;
  final SwordType swordType;

  Potion({
    required this.spriteSword,
    required this.swordType,
    required this.tile,
    required super.size,
    required this.spriteSheet,
    required super.position,
  }) : super.withAnimation(
          animation: spriteSheet.load(
            amount: 4,
            initPosition: Vector2(0, size.y * spriteSword),
          ),
        );

  @override
  void onContact(GameComponent component) {
    if (component is LoadPlayer) {
      if (swordType == SwordType.life && component.life < 10) {
        component.potionsHealth = 1;
        removeFromParent();
      } else if (swordType == SwordType.death) {
        component.sword = 1;
        removeFromParent();
      }
    }
  }
}
