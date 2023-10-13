import 'package:hongyan/base/bonfire_game_interface.dart';
import 'package:hongyan/bonfire.dart';
import 'package:flutter/widgets.dart' as widget;

/// SceneAction that move camera to specific position os to follow the Component in the game.
class CameraSceneAction extends SceneAction {
  final Vector2? position;
  final GameComponent? target;
  final Duration duration;
  final double? zoom;
  final double? angle;
  final widget.Curve curve;

  bool _running = false;
  bool _done = false;

  CameraSceneAction({
    dynamic id,
    this.position,
    this.target,
    this.zoom,
    this.angle,
    this.curve = widget.Curves.decelerate,
    required this.duration,
  }) : super(id);
  CameraSceneAction.position(
    this.position, {
    dynamic id,
    this.duration = const Duration(seconds: 1),
    this.zoom,
    this.angle,
    this.curve = widget.Curves.decelerate,
  })  : target = null,
        super(id);

  CameraSceneAction.target(
    this.target, {
    dynamic id,
    this.duration = const Duration(seconds: 1),
    this.zoom,
    this.angle,
    this.curve = widget.Curves.decelerate,
  })  : position = null,
        super(id);

  @override
  bool runAction(double dt, BonfireGameInterface game) {
    if (!_running) {
      _running = true;
      if (position != null) {
        game.camera.moveToPositionAnimated(
          position!,
          duration: duration,
          finish: _actionDone,
          curve: curve,
          angle: angle,
          zoom: zoom,
        );
      } else if (target != null) {
        game.camera.moveToTargetAnimated(
          target!,
          duration: duration,
          finish: _actionDone,
          curve: curve,
          angle: angle,
          zoom: zoom,
        );
      } else {
        return true;
      }
    }
    if (_done) {
      return true;
    }
    return false;
  }

  void _actionDone() {
    _done = true;
  }
}
