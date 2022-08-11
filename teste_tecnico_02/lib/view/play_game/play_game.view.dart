import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_02/game/load_enemy.dart';
import 'package:teste_tecnico_02/game/load_player.dart';
import 'package:teste_tecnico_02/game/load_sprite_sheet.dart';

class PlayGameView extends StatefulWidget {
  final double tile;
  const PlayGameView({super.key, required this.tile});

  @override
  State<PlayGameView> createState() => _PlayGameViewState();
}

class _PlayGameViewState extends State<PlayGameView> {
  late Vector2 playerPosition;

  // Default values for the sprite sheet
  Map<String, Vector2> striteDimensions = {
    'type1': Vector2(16, 32), // Dimensions for the player
    'type2': Vector2(16, 16), // Dimensions for the enemies
  };

  @override
  void initState() {
    // O estado precisa ser iniciado para ter acesso ao widget.tile
    playerPosition = Vector2(
      19 * widget.tile,
      2 * widget.tile,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 900,
          height: 400,
          child: BonfireTiledWidget(
            joystick: Joystick(
              keyboardConfig: KeyboardConfig(
                keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
              ),
            ),
            cameraConfig: CameraConfig(
              zoom: 2.5,
              angle: 5,
              smoothCameraEnabled: true,
              smoothCameraSpeed: 0.8,
              moveOnlyMapArea: true,
            ),
            map: TiledWorldMap(
              'maps/dungeon.json',
              objectsBuilder: {
                'enemy1': (properties) => LoadEnemy(
                      enemySpeed: 20,
                      radiusVision: 100,
                      enemyType: EnemyType.type1,
                      enemyPosition: properties.position,
                      tile: widget.tile,
                      spriteSheet: LoadSpriteSheet(
                        Vector2(16, 16),
                        'sprites/enemies.png',
                      ),
                    ),
                'enemy2': (properties) => LoadEnemy(
                      enemySpeed: 30,
                      radiusVision: 130,
                      enemyType: EnemyType.type2,
                      enemyPosition: properties.position,
                      tile: widget.tile,
                      spriteSheet: LoadSpriteSheet(
                        Vector2(16, 16),
                        'sprites/enemies.png',
                      ),
                    ),
                'enemy3': (properties) => LoadEnemy(
                      enemySpeed: 40,
                      radiusVision: 150,
                      enemyType: EnemyType.type3,
                      enemyPosition: properties.position,
                      tile: widget.tile,
                      spriteSheet: LoadSpriteSheet(
                        Vector2(16, 16),
                        'sprites/enemies.png',
                      ),
                    ),
              },
            ),
            player: LoadPlayer(
              playerPosition,
              spriteSheet: LoadSpriteSheet(
                striteDimensions['type1']!,
                'sprites/sprites.png',
              ),
            ),
            showCollisionArea: true,
          ),
        ),
      ),
    );
  }
}
