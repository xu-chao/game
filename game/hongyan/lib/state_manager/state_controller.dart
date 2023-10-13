import 'package:hongyan/base/bonfire_game_interface.dart';
import 'package:hongyan/bonfire.dart';
import 'package:flutter/cupertino.dart';

abstract class StateController<T extends GameComponent> extends ChangeNotifier {
  final List<T> components = [];
  T? get component => components.isNotEmpty ? components.first : null;

  void update(double dt, T component);

  BonfireGameInterface get gameRef {
    if (components.isEmpty) {
      throw StateError(
        'Cannot find reference $BonfireGameInterface in the component',
      );
    }
    return components.first.gameRef;
  }

  void onReady(T component) {
    components.add(component);
  }

  void onRemove(T component) {
    components.remove(component);
  }
}
