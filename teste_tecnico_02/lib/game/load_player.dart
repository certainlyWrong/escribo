import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:teste_tecnico_02/game/load_enemy.dart';
import 'package:teste_tecnico_02/game/load_sprite_sheet.dart';
import 'package:teste_tecnico_02/view/play_game/interface/status_bar.controller.dart';

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

class LoadPlayer extends SimplePlayer with ObjectCollision, Lighting {
  final double spriteheight;
  final PlayerType playerType;
  int _money = 0, _sword = 0;
  final LoadSpriteSheet spriteSheet;
  StatusBarController? _statusBarController;

  LoadPlayer(
    Vector2 position, {
    this.spriteheight = 32,
    this.playerType = PlayerType.dino2,
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
          life: 5,
        ) {
    setupLighting(
      LightingConfig(
        color: Colors.transparent,
        radius: width * 4,
        blurBorder: width * 4,
      ),
    );
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

  set money(int value) {
    _money += value;
  }

  int get money => _money;

  set sword(int value) {
    _sword += value;
  }

  int get sword => _sword;

  set potionsHealth(int value) {
    life += value;
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is LoadEnemy && !component.isDead) {
      component.removeFromParent();
      component.die();
      if (_sword <= 0) {
        if (life <= 1) {
          die();
        }
        life--;
      } else {
        _sword--;
      }
    }
    debugPrint(life.toString());
    return super.onCollision(component, active);
  }

  // @override
  // void render(Canvas canvas) {
  //   drawDefaultLifeBar(canvas,
  //       borderRadius: BorderRadius.circular(2),
  //       colorsLife: [
  //         Colors.red,
  //         Colors.yellow,
  //         Colors.green,
  //       ],
  //       align: const Offset(0, -15));

  //   super.render(canvas);
  // }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if ((hasGameRef && gameRef.player!.isDead) || money == 24) {
      return;
    }

    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if ((hasGameRef && gameRef.player!.isDead) || money == 24) {
      return;
    }
    super.joystickAction(event);
  }

  @override
  void update(double dt) {
    if (isDead || money == 24) {
      finishGame();
    }

    _statusBarController!.life = life.toInt();
    _statusBarController!.money = money;
    _statusBarController!.sword = sword;
    super.update(dt);
  }

  @override
  void onMount() {
    _statusBarController = BonfireInjector().get<StatusBarController>();
    super.onMount();
  }

  void finishGame() {
    gameRef.camera.moveToPlayerAnimated(
      zoom: 3.5,
      duration: const Duration(seconds: 3),
      finish: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(isDead ? 'Tente novamente!' : 'Parabéns!'),
                content: Text(isDead ? 'Game Over' : 'Você venceu!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/',
                        ((route) => false),
                      );
                    },
                    child: const Text('Voltar'),
                  ),
                ],
              );
            });
      },
    );
  }
}
