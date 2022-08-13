import 'package:bonfire/bonfire.dart';
import 'package:teste_tecnico_02/view/play_game/interface/sword.component.dart';

class StatusBarInterface extends GameInterface {
  @override
  Future<void>? onLoad() {
    add(
      InterfaceComponent(
        id: 1,
        position: Vector2(20, 20),
        size: Vector2(48, 48),
        spriteUnselected: Sprite.load(
          'sprites/lifeAndSword.png',
          srcSize: Vector2(16, 16),
        ),
      ),
    );
    add(
      InterfaceComponent(
        id: 2,
        position: Vector2(80, 20),
        size: Vector2(48, 48),
        spriteUnselected: Sprite.load(
          'sprites/lifeAndSword.png',
          srcPosition: Vector2(0, 16),
          srcSize: Vector2(16, 16),
        ),
      ),
    );

    add(
      InterfaceComponent(
        id: 3,
        position: Vector2(145, 25),
        size: Vector2(32, 64),
        spriteUnselected: Sprite.load(
          'sprites/money.png',
          srcPosition: Vector2(0, 0),
          srcSize: Vector2(8, 16),
        ),
      ),
    );
    return super.onLoad();
  }
}
