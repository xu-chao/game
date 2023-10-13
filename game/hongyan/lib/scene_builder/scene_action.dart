import 'package:hongyan/base/bonfire_game_interface.dart';

/// Class used with base to create `SceneActions`
abstract class SceneAction {
  final dynamic id;

  SceneAction(this.id);
  bool runAction(double dt, BonfireGameInterface game);
}
