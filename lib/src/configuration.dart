import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:utilities/utilities.dart';

import 'gen/theme/colors.helpis.dart';
import 'routes.dart';
import 'widgets/destination_icon.dart';
import 'widgets/switch_theme_button.dart';

GoRouterAdaptiveScaffoldConfig configureAdaptiveScaffold({
  required final BuildContext context,
  required final GoRouterBodyConfig bodyConfig,
  final DrawerCallback? onDrawerChanged,
}) =>
    GoRouterAdaptiveScaffoldConfig(
      useSalomonBar: true,
      useInternalAnimations: false,
      drawerConfig: AdaptiveDrawerConfig(
        onDrawerChanged: onDrawerChanged,
      ),
      navigationRailConfig: configureNavigationRail(context),
      appBar: configureAppBar(context),
      scrollbarConfig: configureAdaptiveScrollbar(context),
      bodyConfig: bodyConfig,
    );

AdaptiveAppBar configureAppBar(final BuildContext context) {
  final ButtonStyle iconStyle = IconButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    fixedSize: const Size.square(54),
    iconSize: 36,
  );
  return AdaptiveAppBar.fromContext(
    context: context,
    title: H4(
      context.currentRoute.title(context),
      style: H4.defaultStyle.copyWith(
        fontFamily: GoogleFonts.comfortaa().fontFamily,
      ),
    ),
    gtkSpecificOptions: GTKAppBarSpecificOptions(
      backButtonStyle: iconStyle,
      trailing: <Widget>[SwitchThemeButton(iconStyle: iconStyle)],
    ),
  );
}

AdaptiveScrollbarConfig configureAdaptiveScrollbar(
  final BuildContext context,
) =>
    AdaptiveScrollbarConfig(
      controller: ScrollController(),
      width: 28,
      sliderDefaultColor: context.currentTheme.onTertiaryContainer,
      sliderActiveColor: context.currentTheme.onSurface,
      underColor: context.currentTheme.tertiaryContainer,
      sliderSpacing: EdgeInsets.zero,
    );

NavigationRailConfig configureNavigationRail(final BuildContext context) =>
    NavigationRailConfig(
      backgroundColor: context.currentTheme.themeData.scaffoldBackground,
      padding: EdgeInsets.zero,
      extendedWidth: 300,
      elevation: 2,
      selectedIndex: context.currentRoute.index,
      onDestinationSelected: (final int index, final _, final __) async =>
          AppRoute.fromIndex(index)?.navigate<void>(context, RoutingMethod.go),
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: const DestinationIcon(iconData: Icons.start_rounded),
          label: const OpeningRoute().title(context),
        ),
        NavigationDestination(
          icon: const DestinationIcon(iconData: Icons.price_check),
          label: const ProductListRoute().title(context),
        ),
        NavigationDestination(
          icon: const DestinationIcon(iconData: Icons.settings),
          label: const SettingsRoute().title(context),
        ),
      ],
    );

final Logger logger = Logger(
  level: Level.warning,
  printer: PrefixPrinter(
    PrettyPrinter(methodCount: 15, printTime: true),
    debug: 'DEBUG',
    trace: 'TRACE',
    info: 'INFO',
    warning: 'WARNING',
    error: 'ERROR',
    fatal: 'FATAL',
  ),
);

bool get configureGTK => Platform.isDesktop && !Platform.isWeb;
