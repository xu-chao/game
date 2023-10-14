import 'package:hongyan/bonfire.dart';
import 'package:game/manual_map/dungeon_map.dart';
import 'package:game/shared/util/player_sprite_sheet.dart';
import 'package:game/shared/util/wizard_sprite_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wizard extends SimpleNpc with ObjectCollision, TapGesture {
  Wizard(Vector2 position)
      : super(
          animation: WizardSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(DungeonMap.tileSize * 0.8),
          speed: DungeonMap.tileSize * 1.6,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              DungeonMap.tileSize * 0.4,
              DungeonMap.tileSize * 0.4,
            ),
            align: Vector2(
              DungeonMap.tileSize * 0.2,
              DungeonMap.tileSize * 0.4,
            ),
          ),
        ],
      ),
    );
  }

  void execShowTalk(GameComponent first) {
    gameRef.camera.moveToTargetAnimated(
      first,
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text:
                      '请你告诉我。。。我该从这里往哪走？',
                )
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: '这在很大程度上取决于你想去哪里。',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: WizardSpriteSheet.idle.asWidget(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
            Say(
              text: [
                const TextSpan(
                  text: '我不太在乎在哪里。',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: PlayerSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: '那么，你走哪条路并不重要。',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: WizardSpriteSheet.idle.asWidget(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
          ],
          onClose: () {
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }

  @override
  void onTap() {
    execShowTalk(this);
  }
}
