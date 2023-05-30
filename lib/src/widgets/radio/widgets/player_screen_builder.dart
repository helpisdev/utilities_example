import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../config.dart';
import 'track_player.dart';

typedef RadioPlayerBuilderCallback<T extends ScreenWidget<T>> = T Function(
  BuildContext context,
  GoRouterState state,
);

typedef GRASConf = GoRouterAdaptiveScaffoldConfig;

class RadioPlayerBuilder<T extends ScreenWidget<T>>
    extends StatefulScreenWidget {
  const RadioPlayerBuilder({
    required this.builder,
    required this.state,
    required this.visible,
    super.key,
  }) : super();

  @override
  final GoRouterState state;

  final RadioPlayerBuilderCallback<T> builder;
  final bool visible;

  @override
  ScreenState<RadioPlayerBuilder<T>> createState() =>
      RadioPlayerBuilderState<T>();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<RadioPlayerBuilderCallback<T>>.has(
          'builder',
          builder,
        ),
      )
      ..add(DiagnosticsProperty<bool>('visible', visible));
  }
}

class RadioPlayerBuilderState<T extends ScreenWidget<T>>
    extends ScreenState<RadioPlayerBuilder<T>> {
  final ScrollController _scrollController = ScrollController();
  double _left = 0;
  EdgeInsets _padding = EdgeInsets.zero;

  void _listener() => setState(() => _left = _scrollController.offset);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_listener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final T screen = generateScreen(context);
    final double offset = context.width < PredefinedBreakpoint.medium.begin
        ? screen.adaptiveScaffoldConfig?.scrollbarConfig.width ?? 0
        : 0;
    _schedulePaddingComputation(offset);
    return SafeArea(
      child: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            screen,
            Positioned(
              bottom: offset,
              left: -_left,
              child: TrackPlayerVisibility(
                onHorizontalDragUpdate: _updatePlayerScroll,
                visible: widget.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _schedulePaddingComputation(final double offset) =>
      WidgetsBinding.instance.addPostFrameCallback(
        (final Duration timestamp) {
          final double height =
              PlayerConfig.playerKey.currentState?.size?.height ?? 0;
          final EdgeInsets padding = EdgeInsets.only(bottom: height + offset);
          if (padding != _padding) {
            setState(() => _padding = padding);
          }
        },
      );

  T generateScreen(final BuildContext context) {
    final T screen = widget.builder(context, widget.state);
    return screen.generate(
      key: screen.key,
      state: widget.state,
      scaffold: _confScaffold(screen.scaffold),
      adaptiveScaffoldConfig: _confAdaptiveScaffold(
        screen.adaptiveScaffoldConfig,
      ),
    );
  }

  void _updatePlayerScroll(final DragUpdateDetails details) {
    final double offset = context.width - PredefinedBreakpoint.medium.begin;
    if (offset < 0) {
      setState(
        () {
          _left = clampDouble(_left - details.delta.dx, 0, offset.abs());
          _scrollController.jumpTo(_left);
        },
      );
    }
  }

  ScreenScaffold? _confScaffold(final Scaffold? scaffold) =>
      produceT1fromT2orNull<ScreenScaffold, Scaffold>(
        (final Scaffold scaffold) => ScreenScaffold.from(
          state: widget.state,
          scaffold: scaffold,
          body: AnimatedPadding(
            padding: _padding,
            duration: const Duration(milliseconds: 75),
            child: scaffold.body,
          ),
        ),
        scaffold,
      );

  GRASConf? _confAdaptiveScaffold(final GRASConf? conf) =>
      produceValOrNull<GRASConf>(
        (final GRASConf config) {
          final AdaptiveScrollbarConfig scrollbarConf =
              config.scrollbarConfig.copyWith(
            updates: <String, dynamic>{'controller': _scrollController},
          );
          return GRASConf.from(
            config: config,
            bodyConfig: config.bodyConfig.wrap(
              (final WidgetBuilder? body) => produceT1fromT2orNull<
                  WidgetBuilderWithGoRouterState, WidgetBuilder>(
                (final WidgetBuilder body) => (
                  final BuildContext context, [
                  final GoRouterState? state,
                ]) {
                  final Widget animatedBody =
                      (body as WidgetBuilderWithGoRouterState).call(
                    context,
                    state,
                  );
                  return AnimatedPadding(
                    padding: _padding,
                    duration: const Duration(milliseconds: 75),
                    child: animatedBody,
                  );
                },
                body,
              ),
            ),
            scrollbarConfig: scrollbarConf,
          );
        },
        conf,
      );
}

class TrackPlayerVisibility extends StatelessWidget {
  const TrackPlayerVisibility({
    required this.visible,
    required this.onHorizontalDragUpdate,
    super.key,
  });

  final bool visible;
  final GestureDragUpdateCallback onHorizontalDragUpdate;

  @override
  Widget build(final BuildContext context) => TransparentPointer(
        child: Visibility.maintain(
          visible: visible,
          child: GestureDetector(
            onHorizontalDragUpdate: onHorizontalDragUpdate,
            child: const TrackPlayer(),
          ),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('visible', visible))
      ..add(
        ObjectFlagProperty<GestureDragUpdateCallback>.has(
          'onHorizontalDragUpdate',
          onHorizontalDragUpdate,
        ),
      );
  }
}
