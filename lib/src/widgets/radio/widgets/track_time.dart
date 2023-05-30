import 'dart:core';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../player.dart';
import 'player_provider.dart';

/// Displays music duration
class TrackTime extends StatelessWidget {
  /// Initializes music slider
  const TrackTime({super.key});

  @override
  Widget build(final BuildContext context) {
    final Player player = TrackPlayerProvider.of(context).player;
    return ValueListenableBuilder<TrackPlayerListenable>(
      valueListenable: player,
      builder: (
        final BuildContext context,
        final TrackPlayerListenable track,
        final Widget? child,
      ) =>
          StreamBuilder<Duration?>(
        stream: player.player.positionStream,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<Duration?> snapshot,
        ) {
          final Duration position = snapshot.data ?? Duration.zero;
          return StreamBuilder<Duration?>(
            stream: player.player.durationStream,
            builder: (
              final BuildContext context,
              final AsyncSnapshot<Duration?> snapshot,
            ) {
              final Duration duration = snapshot.data ?? Duration.zero;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TrackDuration(
                      duration: duration,
                      position: position,
                    ),
                  ),
                  TrackPosition(position: position),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class TrackPosition extends StatelessWidget {
  const TrackPosition({required this.position, super.key});

  final Duration position;

  @override
  Widget build(final BuildContext context) =>
      BodySmall(position.text, maxLines: 5);

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Duration>('position', position));
  }
}

class TrackDuration extends StatelessWidget {
  const TrackDuration({
    required this.duration,
    required this.position,
    super.key,
  });

  final Duration duration;
  final Duration position;

  @override
  Widget build(final BuildContext context) {
    final Player player = TrackPlayerProvider.of(context).player;
    double val = 0;
    if (position > Duration.zero && position < duration) {
      val = (position.inMilliseconds / duration.inMilliseconds) / 10;
    } else {
      val = 1 - (1 / ((position.inMilliseconds / 1000000) + 1));
    }
    final int milliseconds = max(duration.inMilliseconds, 1);
    return Slider(
      onChanged: (final double value) async {
        await player.seek(Duration(milliseconds: milliseconds));
      },
      value: val,
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Duration>('duration', duration))
      ..add(DiagnosticsProperty<Duration>('position', position));
  }
}
