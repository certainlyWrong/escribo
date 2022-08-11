import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_02/game/load_sprite_sheet.dart';

enum EnemyType {
  type1,
  type2,
  type3,
}

class LoadEnemy extends SimpleEnemy with ObjectCollision {
  final double tile, radiusVision, enemySpeed;
  final EnemyType enemyType;
  final Vector2 enemyPosition;
  final LoadSpriteSheet spriteSheet;

  LoadEnemy({
    required this.enemySpeed,
    required this.radiusVision,
    required this.enemyType,
    required this.spriteSheet,
    required this.tile,
    required this.enemyPosition,
  }) : super(
          position: enemyPosition,
          size: Vector2(tile, tile),
          life: 2,
          animation: SimpleDirectionAnimation(
            idleRight: spriteSheet.load(
              initPosition: Vector2(0, enemyType.index * tile),
              amount: 2,
            ),
            runRight: spriteSheet.load(
              initPosition: Vector2(0, enemyType.index * tile),
              amount: 8,
            ),
            idleLeft: spriteSheet.load(
              initPosition: Vector2(14 * tile, enemyType.index * tile),
              amount: 2,
            ),
            runLeft: spriteSheet.load(
              initPosition: Vector2(8 * tile, enemyType.index * tile),
              amount: 8,
            ),
          ),
          speed: enemySpeed,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 4,
            align: Vector2(4, 6),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    seeAndMoveToPlayer(
      closePlayer: (player) {
        print(player.isVisible);
        return true;
      },
      radiusVision: radiusVision,
    );
  }

  // override this method render
  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      colorsLife: [Colors.red, Colors.blue],
      align: const Offset(0, -8),
    );
    super.render(canvas);
  }
}
