import 'package:hongyan/bonfire.dart';
import 'package:game/manual_map/dungeon_map.dart';
import 'package:game/shared/util/common_sprite_sheet.dart';

class PotionLife extends GameDecoration with Sensor<Player> {
  final double life;
  double _lifeDistributed = 0;

  PotionLife(Vector2 position, this.life)
      : super.withSprite(
          sprite: CommonSpriteSheet.potionLifeSprite,
          position: position,
          size: Vector2.all(DungeonMap.tileSize * 0.5),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      generateValues(
        const Duration(seconds: 1),
        onChange: (value) {
          if (_lifeDistributed < life) {
            double newLife = life * value - _lifeDistributed;
            _lifeDistributed += newLife;
            component.addLife(newLife.roundToDouble());
          }
        },
      );

      removeFromParent();
    }
  }

  @override
  void onContactExit(GameComponent component) {}
}
