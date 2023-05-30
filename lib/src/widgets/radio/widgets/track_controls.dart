import 'dart:core';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../../../gen/l10n/l10n.dart';
import '../player.dart';
import 'player_provider.dart';

/// Displays music controls
class TrackControls extends StatelessWidget {
  /// Initializes music controls
  const TrackControls({super.key});

  @override
  Widget build(final BuildContext context) {
    final Player player = TrackPlayerProvider.of(context).player;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const TrackControl(type: TrackControlType.prev),
        ValueListenableBuilder<TrackPlayerListenable>(
          valueListenable: player,
          builder: (
            final BuildContext context,
            final TrackPlayerListenable track,
            final Widget? child,
          ) =>
              TrackControl(
            type: track.isPlaying
                ? TrackControlType.pause
                : TrackControlType.play,
          ),
        ),
        const TrackControl(type: TrackControlType.next),
      ],
    );
  }
}

class TrackControl extends StatelessWidget {
  const TrackControl({required this.type, super.key});

  final TrackControlType type;

  static const double minTapArea = 28;
  static const double maxTapArea = minTapArea * 4;

  @override
  Widget build(final BuildContext context) {
    const BoxConstraints constraints = BoxConstraints(
      maxWidth: maxTapArea,
      maxHeight: maxTapArea,
      minHeight: minTapArea,
      minWidth: minTapArea,
    );
    final double size = context.widthTransformer(percentage: 3.5);
    final Player player = TrackPlayerProvider.of(context).player;
    return IconButton(
      onPressed: () async => switch (type) {
        TrackControlType.next => player.skipToNext(),
        TrackControlType.prev => player.skipToPrevious(),
        TrackControlType.play => player.play(),
        TrackControlType.pause => player.pause(),
      },
      icon: type.icon(context),
      iconSize: max(min(size, maxTapArea), minTapArea),
      padding: EdgeInsets.zero,
      constraints: constraints,
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<TrackControlType>('type', type));
  }
}

enum TrackControlType {
  next,
  prev,
  play,
  pause;

  Icon icon(final BuildContext context) => switch (this) {
        TrackControlType.next => Icon(
            Icons.skip_next,
            semanticLabel: context.l10n.skipToNext,
          ),
        TrackControlType.prev => Icon(
            Icons.skip_previous,
            semanticLabel: context.l10n.skipToPrevious,
          ),
        TrackControlType.play => Icon(
            Icons.play_arrow,
            semanticLabel: context.l10n.playPlayback,
          ),
        TrackControlType.pause => Icon(
            Icons.pause,
            semanticLabel: context.l10n.pausePlayback,
          )
      };
}
