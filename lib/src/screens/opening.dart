import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../configuration.dart';
import '../entry.dart';
import '../gen/l10n/l10n.dart';
import '../widgets/radio/widgets/player_screen_builder.dart';
import '../widgets/radio/widgets/track_player.dart';
import '../widgets/welcome.dart';

class OpeningScreen extends StatefulScreenWidget {
  const OpeningScreen({
    required this.state,
    super.key,
  });

  @override
  final GoRouterState state;

  @override
  OpeningScreenState createState() => OpeningScreenState();
}

class OpeningScreenState extends ScreenState<OpeningScreen> {
  bool visible = true;
  late final Widget _welcome = Welcome(showSnackBar: showSnackbar);

  GoRouterAdaptiveScaffoldConfig get scaffoldConf => configureAdaptiveScaffold(
        context: context,
        onDrawerChanged: (final bool open) => setState(() => visible = !open),
        bodyConfig: GoRouterBodyConfig(
          body: (final _, [final __]) => _welcome,
          small: (final BuildContext context, [final __]) {
            const PredefinedBreakpoint s = PredefinedBreakpoint.smallAndDown;
            final Breakpoint mobileDevice = s.withPlatform(
              DeviceType.mobile,
            );
            if (mobileDevice.isActive(context)) {
              return SafeArea(
                child: SizedBox(
                  width: context.width,
                  height: context.height,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      _welcome,
                      Positioned(
                        bottom: 0,
                        width: context.width,
                        child: const TrackPlayer(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return _welcome;
          },
        ),
      );

  @override
  Screen build(final BuildContext context) {
    const PredefinedBreakpoint standard = PredefinedBreakpoint.standard;
    final Breakpoint desktop = standard.withPlatform(DeviceType.desktop);
    final StatelessScreen base = StatelessScreen(
      state: widget.state,
      adaptiveScaffoldConfig: scaffoldConf,
    );
    return desktop.isActive(context)
        ? RadioPlayerBuilder<StatelessScreen>(
            builder: (final _, final __) => base,
            visible: visible,
            state: widget.state,
          )
        : base;
  }

  void hideSnackBar() {
    setState(
      () {
        visible = true;
        App.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
      },
    );
  }

  void showSnackbar(final BuildContext context) {
    snackBar(
      App.scaffoldMessengerKey,
      title: context.l10n.awesome,
      message: context.l10n.snackbarMessage,
      action: _snackbarAction(context),
      theme: Platform.isDesktop
          ? const SnackBarTheme(duration: Duration(hours: 1))
          : const SnackBarTheme(),
      contentTheme: const SnackBarContentTheme(
        messagePlacement: SnackBarMessagePlacement(
          MainAxisAlignment.center,
          CrossAxisAlignment.center,
        ),
      ),
      onVisible: () => setState(() => visible = false),
      onTap: hideSnackBar,
    );
  }

  SnackBarAction? _snackbarAction(final BuildContext context) {
    if (Platform.isMobile) {
      return null;
    }
    return SnackBarAction(
      label: context.l10n.gotIt,
      onPressed: hideSnackBar,
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('visible', visible))
      ..add(
        DiagnosticsProperty<GoRouterAdaptiveScaffoldConfig>(
          'scaffoldConfig',
          scaffoldConf,
        ),
      );
  }
}
