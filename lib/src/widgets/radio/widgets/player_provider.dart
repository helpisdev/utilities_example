import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../player.dart';

class TrackPlayerProvider extends InheritedWidget {
  const TrackPlayerProvider({
    required this.player,
    required super.child,
    super.key,
  });

  final Player player;

  static TrackPlayerProvider? maybeOf(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TrackPlayerProvider>();

  static TrackPlayerProvider of(final BuildContext context) {
    final TrackPlayerProvider? result = maybeOf(context);
    assert(result != null, 'No TrackPlayerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(final TrackPlayerProvider oldWidget) =>
      oldWidget.player.track != player.track;

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Player>('player', player));
  }
}
