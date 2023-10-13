import 'package:hongyan/base/game_component.dart';
import 'package:hongyan/mixins/movement.dart';
import 'package:hongyan/mixins/vision.dart';
import 'package:flame/components.dart';

export 'rotation_npc.dart';
export 'simple_npc.dart';

/// It is used to represent your NPC.
class Npc extends GameComponent with Movement, Vision {
  Npc({
    required Vector2 position,
    required Vector2 size,
    double speed = 100,
  }) {
    this.speed = speed;
    this.position = position;
    this.size = size;
  }
}
