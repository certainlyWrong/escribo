import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../game/load_enemy.dart';
import '../../game/load_money.dart';
import '../../game/load_player.dart';
import '../../game/load_sprite_sheet.dart';
import '../../game/load_sword.dart';
import 'interface/status_bar.interface.dart';
import 'interface/status_bar.widget.dart';

class PlayGameView extends StatefulWidget {
  final double tile;
  const PlayGameView({super.key, required this.tile});

  @override
  State<PlayGameView> createState() => _PlayGameViewState();
}

class _PlayGameViewState extends State<PlayGameView> {
  late Vector2 playerPosition, spriteSize;
  late AudioPlayer audioPlayer;
  // Default values for the sprite sheet
  Map<String, Vector2> striteDimensions = {
    'type1': Vector2(16, 32), // Dimensions for the player
    'type2': Vector2(16, 16), // Dimensions for the enemies
  };

  void permissionSound() async {
    audioPlayer = AudioPlayer();

    List<String> aux = [
      'assets/sounds/background1.mp3',
      'assets/sounds/background2.mp3',
      'assets/sounds/background3.mp3',
    ];

    audioPlayer.setLoopMode(LoopMode.one);
    audioPlayer.setAsset(aux[Random().nextInt(aux.length)]);
    await audioPlayer.play();
  }

  @override
  void initState() {
    // O estado precisa ser iniciado para ter acesso ao widget.tile
    playerPosition = Vector2(
      19 * widget.tile,
      2 * widget.tile,
    );
    spriteSize = Vector2(widget.tile, widget.tile);

    permissionSound();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BonfireTiledWidget(
        joystick: Joystick(
          keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          ),
          // directional: JoystickDirectional(),
        ),
        interface: StatusBarInterface(),
        overlayBuilderMap: {
          'status_bar': (context, game) => const StatusBarWidget(),
        },
        initialActiveOverlays: const [
          'status_bar',
        ],
        lightingColorGame: Colors.black.withOpacity(0.7),
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
                  enemySpeed: 10,
                  radiusVision: 150,
                  enemyType: EnemyType.type1,
                  enemyPosition: properties.position,
                  tile: widget.tile,
                  spriteSheet: LoadSpriteSheet(
                    spriteSize,
                    'sprites/enemies.png',
                  ),
                ),
            'enemy2': (properties) => LoadEnemy(
                  enemySpeed: 20,
                  radiusVision: 200,
                  enemyType: EnemyType.type2,
                  enemyPosition: properties.position,
                  tile: widget.tile,
                  spriteSheet: LoadSpriteSheet(
                    spriteSize,
                    'sprites/enemies.png',
                  ),
                ),
            'enemy3': (properties) => LoadEnemy(
                  enemySpeed: 30,
                  radiusVision: 200,
                  enemyType: EnemyType.type3,
                  enemyPosition: properties.position,
                  tile: widget.tile,
                  spriteSheet: LoadSpriteSheet(
                    spriteSize,
                    'sprites/enemies.png',
                  ),
                ),
            'life': (properties) => Potion(
                  spriteSword: 1,
                  swordType: SwordType.life,
                  tile: widget.tile,
                  size: Vector2(widget.tile, widget.tile),
                  position: properties.position,
                  spriteSheet: LoadSpriteSheet(
                    spriteSize,
                    'sprites/lifeAndSword.png',
                  ),
                ),
            'sword': (properties) => Potion(
                  spriteSword: 0,
                  swordType: SwordType.death,
                  tile: widget.tile,
                  size: Vector2(widget.tile, widget.tile),
                  position: properties.position,
                  spriteSheet: LoadSpriteSheet(
                    spriteSize,
                    'sprites/lifeAndSword.png',
                  ),
                ),
            'money': (properties) => Money(
                  tile: widget.tile,
                  size: Vector2(widget.tile, widget.tile),
                  position: properties.position,
                  spriteSheet: LoadSpriteSheet(
                    spriteSize,
                    'sprites/money.png',
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
        // showCollisionArea: kDebugMode,
      ),
    );
  }
}
