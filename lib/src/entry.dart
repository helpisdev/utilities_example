import 'dart:async';
import 'dart:collection';

import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
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

typedef ScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>;
typedef NavigatorKey = GlobalKey<NavigatorState>;

class App extends StatefulWidget {
  const App({super.key});

  static final ScaffoldMessengerKey scaffoldMessengerKey =
      ScaffoldMessengerKey();

  static final NavigatorKey navigatorKey = NavigatorKey();

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

  String? _storedLocale() => storage.read<String>(StorageKey.locale.name);
  bool? _storedTheme() => storage.read<bool>(StorageKey.isDarkMode.name);

  AppLocalizations? _l10n;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    unawaited(_init());
  }

  @override
  void dispose() {
    unawaited(logger.close());
    unawaited(player?.dispose());
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => _loading
      ? const MaterialLoader()
      : TrackPlayerProvider(
          player: player = Player.from(
            player: player,
            playlist: _generateTracks(),
          ),
          child: const _AppRouter(),
        );

  // We can display a loader while this is initializing for better UX. Doesn't
  // block too much, but saves a bit
  //
  // The real lag problem comes from the initialization of GTK.
  Future<void> _init() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    await storage.init();

    util.ensureInitialized();
    if (util.Platform.isWeb) {
      util.usePathUrlStrategy();
    }

    final util.PermissionHandler permissions = util.PermissionHandler(
      permissions: <Permission>{
        Permission.audio,
        Permission.bluetooth,
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
        Permission.mediaLibrary,
        Permission.notification,
        Permission.storage,
      },
    );

    unawaited(permissions.request());

    if (!util.Platform.isWeb) {
      await PlayerConfig.configureAudio();
      if (util.Platform.isLinux) {
        PlayerConfig.configureMPV();
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((final Duration timestamp) {
      _configTheme();
      _configLocale();
      setState(() => _loading = false);
    });
  }

  void _configTheme() {
    final ThemeProvider theme = ThemeProvider.of(context);
    // Theme is not accessible by default yet (we use the MaterialApp in the
    // build of this widget) but it will fallback to a default value and not
    // raise any exception.
    final bool isDarkMode = _storedTheme() ?? context.isDarkMode;
    if (isDarkMode && theme.enhancedThemeMode != EnhancedThemeMode.dark) {
      theme.switchTheme();
    }
  }

  void _configLocale() {
    final Locale locale = Locale(
      _storedLocale() ?? util.Localizations.systemLocale.languageCode,
    );
    unawaited(
      lookupAppLocalizations(locale).then((final AppLocalizations l10n) {
        context.changeLocale(locale);
        setState(() => _l10n = l10n);
      }),
    );
  }

  DoubleLinkedQueue<Track> _generateTracks() => DoubleLinkedQueue<Track>.from(
        <Track>[
          Track(
            id: PlayerConfig.track1.id,
            title: _l10n?.stream1Title ?? '',
            artist: 'https://stream.gal.io/arrow?1579873649949',
            url: PlayerConfig.track1.uri,
            index: 0,
            artData: PlayerConfig.track1.art,
          ),
          Track(
            id: PlayerConfig.track2.id,
            title: _l10n?.stream2Title ?? '',
            url: PlayerConfig.track2.uri,
            index: 1,
            artData: PlayerConfig.track2.art,
          ),
          Track(
            id: PlayerConfig.track3.id,
            title: _l10n?.stream3Title ?? '',
            url: PlayerConfig.track3.uri,
            index: 2,
            artData: PlayerConfig.track3.art,
          ),
        ],
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Player?>('player', player));
  }
}

class _AppRouter extends StatelessWidget {
  const _AppRouter();

  List<LocalizationsDelegate<dynamic>> get _delegates =>
      <LocalizationsDelegate<dynamic>>[
        ...AppLocalizations.localizationsDelegates,
        if (configureGTK) GTKLocalizations.delegate,
      ];

  @override
  Widget build(final BuildContext context) {
    final ThemeProvider themeProvider = ThemeProvider.of(context);
    return MaterialApp.router(
      scaffoldMessengerKey: App.scaffoldMessengerKey,
      routerConfig: App.router,
      debugShowCheckedModeBanner: false,
      theme: themeProvider.light.data,
      darkTheme: themeProvider.dark.data,
      themeMode: themeProvider.mode,
      scrollBehavior: const util.WebDragScrollBehavior(),
      locale: context.localizationsProvider.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: _delegates,
    );
  }
}

class MaterialLoader extends StatelessWidget {
  const MaterialLoader({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor:
                        AppTheme.rustDarkTheme.themeData.background,
                    color: AppTheme.rustDarkTheme.themeData.onBackground,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
