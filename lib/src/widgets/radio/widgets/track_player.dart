import 'dart:core';
import 'dart:math';

import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../../../gen/theme/colors.helpis.dart';
import '../../../routes.dart';
import 'track_channel.dart';
import 'track_controls.dart';
import 'track_time.dart';

class TrackPlayer extends StatefulWidget {
  const TrackPlayer({super.key});

  @override
  State<TrackPlayer> createState() => TrackPlayerState();
}

class TrackPlayerState extends State<TrackPlayer> {
  Size? size;
  Duration? _computationTimeStamp;
  Duration? _recentTimeStamp;

  bool _shouldRecomputeSize() {
    if (_computationTimeStamp == null || _recentTimeStamp == null) {
      return true;
    }
    // Recompute every 3 seconds
    return (_recentTimeStamp! - _computationTimeStamp!).inSeconds > 3;
  }

  @override
  Widget build(final BuildContext context) {
    double minWidth = PredefinedBreakpoint.medium.begin;
    if (Platform.isMobile) {
      minWidth = context.width;
    } else {
      if (context.currentRoute case OpeningRoute()) {
        _scheduleSizeComputation(context);
      }
    }
    return TrackPlayerContainer(minWidth: minWidth);
  }

  void _scheduleSizeComputation(final BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (final Duration timeStamp) {
        // Recompute only so often
        _recentTimeStamp = timeStamp;
        if (_shouldRecomputeSize()) {
          _computationTimeStamp = timeStamp;
          final Size? computedSize = context.size;
          if (computedSize?.height != size?.height && computedSize != null) {
            setState(
              () {
                size = computedSize;
              },
            );
          }
        }
      },
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Size?>('size', size));
  }
}

class TrackPlayerContainer extends StatelessWidget {
  const TrackPlayerContainer({required this.minWidth, super.key});

  final double minWidth;

  @override
  Widget build(final BuildContext context) => Material(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 200,
            minHeight: 150,
            maxWidth: max(PredefinedBreakpoint.medium.begin, context.width),
            minWidth: minWidth,
          ),
          padding: const EdgeInsets.all(17.5),
          decoration: BoxDecoration(
            color: context.currentTheme.themeData.highlightColor,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: const TrackPlayerComponentsArrangement(),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('minWidth', minWidth));
  }
}

class TrackPlayerComponentsArrangement extends StatelessWidget {
  const TrackPlayerComponentsArrangement({super.key});

  @override
  Widget build(final BuildContext context) => Visibility(
        visible: Platform.isMobile,
        replacement: const TrackPlayerDesktopComponentsArrangement(),
        child: const TrackPlayerMobileComponentsArrangement(),
      );
}

class TrackPlayerDesktopComponentsArrangement extends StatelessWidget {
  const TrackPlayerDesktopComponentsArrangement({super.key});

  @override
  Widget build(final BuildContext context) => const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            flex: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 75,
                  child: Row(
                    children: <Widget>[
                      Flexible(flex: 25, child: ChannelImage()),
                      Spacer(flex: 5),
                      Flexible(flex: 70, child: ChannelInfo()),
                    ],
                  ),
                ),
                Flexible(flex: 25, child: TrackControls()),
              ],
            ),
          ),
          Spacer(flex: 5),
          Flexible(flex: 15, child: TrackTime()),
        ],
      );
}

class TrackPlayerMobileComponentsArrangement extends StatelessWidget {
  const TrackPlayerMobileComponentsArrangement({super.key});

  @override
  Widget build(final BuildContext context) => const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(flex: 50, child: ChannelImage()),
                      Flexible(flex: 50, child: TrackControls()),
                    ],
                  ),
                ),
                Flexible(flex: 40, child: ChannelInfo()),
              ],
            ),
          ),
          Flexible(flex: 20, child: TrackTime()),
        ],
      );
}
