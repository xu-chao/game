import 'package:hongyan/bonfire.dart';

class CollisionGameComponent extends GameComponent with ObjectCollision {
  final String name;

  CollisionGameComponent({
    this.name = '',
    Map<String, dynamic>? properties,
    required Vector2 position,
    required Vector2 size,
    List<CollisionArea> collisions = const [],
  }) {
    this.properties = properties;
    this.position = position;
    this.size = size;
    setupCollision(
      CollisionConfig(collisions: collisions),
    );
  }
}
