import 'dart:ui';

import 'package:hongyan/base/game_component.dart';
import 'package:flame/sprite.dart';

mixin UseSprite on GameComponent {
  Sprite? sprite;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (isVisible) {
      sprite?.render(
        canvas,
        position: position,
        size: size,
        overridePaint: paint,
      );
    }
  }
}
