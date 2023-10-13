import 'dart:ui';

import 'package:hongyan/collision/object_collision.dart';
import 'package:hongyan/npc/ally/ally.dart';

import '../../../player/player.dart';
import '../extensions.dart';

extension RotationEnemyExtensions on RotationAlly {
  /// Checks whether the player is within range. If so, move to it.
  void seeAndMoveToPlayer({
    required Function(Player) closePlayer,
    double radiusVision = 32,
    double margin = 10,
    bool runOnlyVisibleInScreen = true,
  }) {
    if (isDead) return;
    if (runOnlyVisibleInScreen && !isVisible) return;

    seePlayer(
      radiusVision: radiusVision,
      observed: (player) {
        double radAngle = getAngleFromPlayer();

        Rect playerRect = player is ObjectCollision
            ? (player as ObjectCollision).rectCollision
            : player.toRect();
        Rect rectPlayerCollision = Rect.fromLTWH(
          playerRect.left - margin,
          playerRect.top - margin,
          playerRect.width + (margin * 2),
          playerRect.height + (margin * 2),
        );

        if (rectConsideringCollision.overlaps(rectPlayerCollision)) {
          closePlayer(player);
          idle();
          moveFromAngleDodgeObstacles(0, radAngle);
          return;
        }

        bool onMove = moveFromAngleDodgeObstacles(speed, radAngle);
        if (!onMove) {
          idle();
        }
      },
      notObserved: () {
        idle();
      },
    );
  }
}
