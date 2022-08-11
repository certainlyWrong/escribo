import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_02/game/load_sprite_sheet.dart';

/// Possivel opção para escolher a skin do player
/// Se eu tiver tempo de implementar...
enum PlayerType {
  human1,
  human2,
  warrior1,
  warrior2,
  mage1,
  mage2,
  dino1,
  dino2,
}

class LoadPlayer extends SimplePlayer with ObjectCollision {
  final double spriteheight;
  final PlayerType playerType;
  final LoadSpriteSheet spriteSheet;

  LoadPlayer(
    Vector2 position, {
    this.spriteheight = 32,
    this.playerType = PlayerType.dino1,
    required this.spriteSheet,
  }) : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: spriteSheet.load(
                initPosition:
                    Vector2(0, playerType.index.toDouble() * spriteheight),
                amount: 2),
            runRight: spriteSheet.load(
                initPosition:
                    Vector2(0, playerType.index.toDouble() * spriteheight),
                amount: 4),
            idleLeft: spriteSheet.load(
                initPosition:
                    Vector2(256, playerType.index.toDouble() * spriteheight),
                amount: 2),
            runLeft: spriteSheet.load(
                initPosition:
                    Vector2(224, playerType.index.toDouble() * spriteheight),
                amount: 4),
          ),
          size: Vector2(16, 32),
          speed: 90,
          life: 3,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 4,
            align: Vector2(3, 20),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    seeEnemy(
        observed: ((enemies) {
          if (enemies.isNotEmpty) {
            die();
          }
        }),
        radiusVision: 0);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    drawDefaultLifeBar(
      canvas,
      colorsLife: [Colors.red, Colors.blue],
      align: const Offset(0, -15),
    );
  }
}
