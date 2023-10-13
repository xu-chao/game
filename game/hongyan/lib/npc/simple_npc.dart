import 'package:hongyan/npc/npc.dart';
import 'package:hongyan/util/direction.dart';
import 'package:hongyan/util/direction_animations/simple_direction_animation.dart';
import 'package:hongyan/mixins/direction_animation.dart';
import 'package:flame/components.dart';

/// Enemy with animation in all direction
class SimpleNpc extends Npc with DirectionAnimation {
  SimpleNpc({
    required Vector2 position,
    required Vector2 size,
    SimpleDirectionAnimation? animation,
    double speed = 100,
    Direction initDirection = Direction.right,
  }) : super(
          position: position,
          size: size,
          speed: speed,
        ) {
    this.animation = animation;
    lastDirection = initDirection;
    lastDirectionHorizontal =
        initDirection == Direction.left ? Direction.left : Direction.right;
  }
}
