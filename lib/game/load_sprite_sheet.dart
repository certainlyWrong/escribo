import 'package:bonfire/bonfire.dart';

class LoadSpriteSheet {
  final String path;
  final Vector2 spiteSize;

  LoadSpriteSheet(this.spiteSize, this.path);

  /// Load a sprite sheet
  /// [initPosition] is used to set the initial position of the sprite sheet
  /// [pathOverwrite] is used to overwrite the path of the sprite sheet
  Future<SpriteAnimation> load({
    String? pathOverwrite,
    Vector2? tileSizeOverwrite,
    bool? loop,
    required int amount,
    required Vector2 initPosition,
  }) async {
    return SpriteAnimation.load(
      pathOverwrite ?? path,
      SpriteAnimationData.sequenced(
        amount: amount,
        textureSize: tileSizeOverwrite ?? spiteSize,
        stepTime: 0.2,
        loop: loop ?? true,
        texturePosition: initPosition,
      ),
    );
  }
}
