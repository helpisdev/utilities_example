import 'dart:async';
import 'dart:collection';

import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart' as util;

import 'configuration.dart';
import 'gen/l10n/app_localizations.dart';
import 'gen/theme/colors.helpis.dart';
import 'routes.dart';
import 'service/cache/storage_service.helpis.dart';
import 'theme.dart';
import 'widgets/radio/config.dart';
import 'widgets/radio/player.dart';
import 'widgets/radio/widgets/player_provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static util.GoRouter router = util.GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    navigatorKey: navigatorKey,
    initialLocation: const OpeningRoute().location,
  );

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Player? player;

  @override
  void dispose() {
    logger.close();
    unawaited(player?.dispose());
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Theming(
        child: util.Localizations(
          child: Builder(
            builder: (final BuildContext context) {
              final ThemeProvider theme = ThemeProvider.of(context);
              final String localeName =
                  storage.read<String>(StorageKey.locale.name) ??
                      context.localizationsProvider.locale.languageCode;
              final Locale locale = Locale(localeName);
              final bool isDarkTheme =
                  storage.read<bool>(StorageKey.isDarkMode.name) ?? false;

              WidgetsBinding.instance.addPostFrameCallback(
                (final Duration timeStamp) {
                  if (isDarkTheme &&
                      theme.enhancedThemeMode != EnhancedThemeMode.dark) {
                    theme.switchTheme();
                  }
                  context.changeLocale(locale);
                },
              );

              return FutureBuilder<AppLocalizations>(
                future: Future<AppLocalizations>.microtask(
                  () async => lookupAppLocalizations(locale),
                ),
                builder: (
                  final BuildContext context,
                  final AsyncSnapshot<AppLocalizations> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                      ],
                    );
                  }
                  final AppLocalizations l10n = snapshot.data!;
                  return TrackPlayerProvider(
                    player: player = Player.from(
                      player: player,
                      playlist: DoubleLinkedQueue<Track>.from(
                        <Track>[
                          Track(
                            id: PlayerConfig.track1.id,
                            title: l10n.stream1Title,
                            artist: 'https://stream.gal.io/arrow?1579873649949',
                            url: PlayerConfig.track1.uri,
                            index: 0,
                            artData: PlayerConfig.track1.art,
                          ),
                          Track(
                            id: PlayerConfig.track2.id,
                            title: l10n.stream2Title,
                            url: PlayerConfig.track2.uri,
                            index: 1,
                            artData: PlayerConfig.track2.art,
                          ),
                          Track(
                            id: PlayerConfig.track3.id,
                            title: l10n.stream3Title,
                            url: PlayerConfig.track3.uri,
                            index: 2,
                            artData: PlayerConfig.track3.art,
                          ),
                        ],
                      ),
                    ),
                    child: util.ScreenSizeProvider(
                      child: MaterialApp.router(
                        scaffoldMessengerKey: App.scaffoldMessengerKey,
                        routerConfig: App.router,
                        debugShowCheckedModeBanner: false,
                        theme: theme.light.data,
                        darkTheme: theme.dark.data,
                        themeMode: theme.mode,
                        scrollBehavior: const util.WebDragScrollBehavior(),
                        locale: context.localizationsProvider.locale,
                        supportedLocales: AppLocalizations.supportedLocales,
                        localizationsDelegates: <LocalizationsDelegate<
                            dynamic>>[
                          ...AppLocalizations.localizationsDelegates,
                          if (util.Platform.isLinux && !util.Platform.isWeb)
                            GTKLocalizations.delegate,
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Player?>('player', player));
  }
}
