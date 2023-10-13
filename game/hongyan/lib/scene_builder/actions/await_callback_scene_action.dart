import 'package:hongyan/base/bonfire_game_interface.dart';
import 'package:hongyan/scene_builder/scene_action.dart';
import 'package:flutter/material.dart';

/// SceneAction that do something until the `completed` callback is called.
class AwaitCallbackSceneAction extends SceneAction {
  bool _isDone = false;
  bool _isFirstRun = true;
  final ValueChanged<VoidCallback> completedCallback;

  AwaitCallbackSceneAction({required this.completedCallback, dynamic id})
      : super(id);

  @override
  bool runAction(double dt, BonfireGameInterface game) {
    if (_isFirstRun) {
      _isFirstRun = false;
      completedCallback(() => _isDone = true);
    }
    return _isDone;
  }
}
