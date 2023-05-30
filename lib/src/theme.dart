import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gen/theme/colors.helpis.dart';

extension Data on UtilitiesExampleTheme<AllTagsAndGroupsEnhancedTheme> {
  /// App's theme config.
  ThemeData get data {
    const FlexSubThemesData subThemeData = FlexSubThemesData(
      blendOnLevel: 40,
      useM2StyleDividerInM3: true,
      thinBorderWidth: 1.5,
      thickBorderWidth: 2.0,
      unselectedToggleIsColored: true,
      sliderTrackHeight: 2,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      fabUseShape: true,
      fabRadius: 60.0,
      popupMenuElevation: 6.0,
      popupMenuOpacity: 0.98,
      tooltipWaitDuration: Duration(milliseconds: 300),
      bottomNavigationBarOpacity: 0.98,
      bottomNavigationBarElevation: 2.0,
      navigationBarHeight: 75.0,
      navigationBarLabelBehavior:
          NavigationDestinationLabelBehavior.onlyShowSelected,
      navigationRailElevation: 2.0,
    );
    return switch (this) {
      UtilitiesExampleTheme.rustLightTheme => FlexThemeData.light(
          scheme: FlexScheme.vesuviusBurn,
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
          blendLevel: 25,
          appBarOpacity: 0.98,
          appBarElevation: 6.0,
          tabBarStyle: FlexTabBarStyle.forBackground,
          subThemesData: subThemeData,
          keyColors: const FlexKeyColors(),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ).copyWith(
          extensions: <ThemeExtension<UtilitiesExampleColors>>[
            UtilitiesExampleColors(this),
          ],
        ),
      UtilitiesExampleTheme.rustDarkTheme => FlexThemeData.dark(
          colors: FlexColor.schemes[FlexScheme.vesuviusBurn]!.light.defaultError
              .toDark(5, true),
          surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
          blendLevel: 25,
          appBarOpacity: 0.98,
          appBarElevation: 4.0,
          tabBarStyle: FlexTabBarStyle.forBackground,
          subThemesData: subThemeData,
          keyColors: const FlexKeyColors(),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ).copyWith(
          extensions: <ThemeExtension<UtilitiesExampleColors>>[
            UtilitiesExampleColors(this),
          ],
        ),
    };
  }
}
