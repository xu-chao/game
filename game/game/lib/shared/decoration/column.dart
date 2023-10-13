import 'package:hongyan/bonfire.dart';
import 'package:game/manual_map/dungeon_map.dart';
import 'package:game/shared/util/common_sprite_sheet.dart';

class ColumnDecoration extends GameDecoration with ObjectCollision {
  ColumnDecoration(Vector2 position)
      : super.withSprite(
          sprite: CommonSpriteSheet.columnSprite,
          position: position,
          size: Vector2(DungeonMap.tileSize, DungeonMap.tileSize * 3),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              DungeonMap.tileSize * 0.8,
              DungeonMap.tileSize / 2,
            ),
            align: Vector2(
              DungeonMap.tileSize * 0.1,
              DungeonMap.tileSize * 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
