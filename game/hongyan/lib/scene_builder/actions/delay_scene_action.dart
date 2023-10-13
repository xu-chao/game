import 'package:hongyan/base/bonfire_game_interface.dart';
import 'package:hongyan/scene_builder/scene_action.dart';
import 'package:hongyan/util/interval_tick.dart';

/// SceneAction that apply a delay in your scene.
class DelaySceneAction extends SceneAction {
  late IntervalTick _tick;
  final Duration delay;

  DelaySceneAction(this.delay) : super(null) {
    _tick = IntervalTick(delay.inMilliseconds);
  }

  @override
  bool runAction(double dt, BonfireGameInterface game) {
    return _tick.update(dt);
  }
}
