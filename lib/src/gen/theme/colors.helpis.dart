// GENERATED CODE FILE -- DO NOT EDIT BY HAND!!!

import 'package:flutter/foundation.dart';
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:utilities/extensions.dart';

/// Signature for the integer value of a color.
typedef ColorValue = int;

/// Signature for a string representing a color name.
typedef ColorName = String;

/// Signature for a string representing a color tag.
typedef ColorTag = String;

/// Signature for a set of color tags.
typedef ColorTagBucket = Set<ColorTag>;

/// Signature for a set of enhanced colors.
typedef EnhancedColorBucket = Map<ColorName, EnhancedColor>;

/// A color with an attached value and a list of identifiers.
@immutable
class EnhancedColor extends Color {
  /// Attaches a provided name and various identifiers to a color.
  const EnhancedColor(
    super.value, {
    required this.name,
    final ColorTagBucket? tags,
  })  : tags = tags ?? const <ColorTag>{},
        super();

  /// Construct a color from the lower 8 bits of four integers.
  ///
  /// * `a` is the alpha value, with 0 being transparent and 255 being fully
  ///   opaque.
  /// * `r` is [red], from 0 to 255.
  /// * `g` is [green], from 0 to 255.
  /// * `b` is [blue], from 0 to 255.
  ///
  /// Out of range values are brought into range using modulo 255.
  ///
  /// See also [EnhancedColor.fromRGBO], which takes the alpha value as a
  /// floating point value.
  const EnhancedColor.fromARGB(
    super.a,
    super.r,
    super.g,
    super.b, {
    required this.name,
    final ColorTagBucket? tags,
  })  : tags = tags ?? const <ColorTag>{},
        super.fromARGB();

  /// Create a color from red, green, blue, and opacity, similar to `rgba()` in
  /// CSS.
  ///
  /// * `r` is [red], from 0 to 255.
  /// * `g` is [green], from 0 to 255.
  /// * `b` is [blue], from 0 to 255.
  /// * `opacity` is alpha channel of this color as a double, with 0.0 being
  ///   transparent and 1.0 being fully opaque.
  ///
  /// Out of range values are brought into range using modulo 255.
  ///
  /// See also [EnhancedColor.fromARGB], which takes the opacity as an integer
  /// value.
  const EnhancedColor.fromRGBO(
    super.r,
    super.g,
    super.b,
    super.opacity, {
    required this.name,
    final ColorTagBucket? tags,
  })  : tags = tags ?? const <ColorTag>{},
        super.fromRGBO();

  /// Name of the color.
  final ColorName name;

  /// List of color identifiers.
  final ColorTagBucket tags;

  @override
  String toString() =>
      "EnhancedColor(${value.toHex}, name: '$name', tags: ${tags.pretty},)";

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is EnhancedColor &&
        (other.value == value && tags == other.tags);
  }

  @override
  int get hashCode => value.hashCode;
}

extension Hex on ColorValue {
  /// Transforms the integer color value to a hexadecimal string representation.
  String get toHex => '0x${toRadixString(16).padLeft(8, '0')}';
}

extension PrettifiedColorTagBucket on ColorTagBucket {
  /// Transforms a set of color tags to a pretty string.
  static String tagsToString(final ColorTagBucket tags) {
    final StringBuffer buffer = StringBuffer(
      '<ColorTag>{${tags.isEmpty ? '}' : '\n'}',
    );
    for (final ColorTag tag in tags) {
      buffer.writeln("'$tag',");
    }
    if (tags.isNotEmpty) {
      buffer.writeln('}');
    }
    return buffer.toString();
  }

  /// Representation of a color's tags.
  String get pretty => tagsToString(this);
}

extension PrettifiedEnhancedColorBucket on EnhancedColorBucket {
  /// Transforms a set of enhanced colors to a pretty string.
  static String enhancedColorsToString(final EnhancedColorBucket colors) {
    final StringBuffer buffer = StringBuffer(
      '<ColorName, EnhancedColor>{${colors.isEmpty ? '}' : '\n'}',
    );
    for (final MapEntry<ColorName, EnhancedColor> color in colors.entries) {
      buffer.writeln("'${color.key.toCamelCase}': const ${color.value},");
    }
    if (colors.isNotEmpty) {
      buffer.writeln('}');
    }
    return buffer.toString();
  }

  /// Representation of a set of enhanced colors.
  String get pretty => enhancedColorsToString(this);
}

/// Signature for a string representing a color group name.
typedef ColorGroupName = String;

/// Signature for a set of color groups.
typedef ColorGroupBucket = Set<ColorGroup>;

/// A named [EnhancedColorBucket].
class ColorGroup {
  /// Attaches a name to an [EnhancedColorBucket].
  const ColorGroup(
    this.name, {
    final EnhancedColorBucket? colors,
  }) : colors = colors ?? const <ColorName, EnhancedColor>{};

  /// Group's name.
  final ColorGroupName name;

  /// Group's associated colors.
  final EnhancedColorBucket colors;

  /// Converts class to a [String] with an optional prefix.
  String stringify([final ColorThemeName? prefix]) =>
      "${prefix != null ? '$prefix${name.toPascalCase}' : 'Color'}"
      "Group('$name', colors: ${colors.pretty},)";
}

extension PrettifiedColorGroupBucket on ColorGroupBucket {
  /// Transforms a set of enhanced colors to a pretty string.
  static String colorGroupsToString(
    final ColorGroupBucket groups, [
    final ColorThemeName? prefix,
  ]) {
    final StringBuffer buffer = StringBuffer(
      '<ColorGroup>{${groups.isEmpty ? '}' : '\n'}',
    );
    for (final ColorGroup group in groups) {
      buffer.writeln('const ${group.stringify(prefix)},');
    }
    if (groups.isNotEmpty) {
      buffer.writeln('}');
    }
    return buffer.toString();
  }

  /// Representation of a set of enhanced colors.
  String pretty([final ColorThemeName? prefix]) => colorGroupsToString(
        this,
        prefix,
      );
}

/// Signature for a string representing a theme name.
typedef ColorThemeName = String;

/// Signature for a set of enhanced themes.
typedef EnhancedThemeBucket = Set<EnhancedTheme>;

/// Simple theme mode enum with light/dark values.
enum EnhancedThemeMode {
  /// Light theme mode.
  light,

  /// Dark theme mode.
  dark;

  /// The equivalent [ThemeMode].
  ThemeMode get equivalent => this == light ? ThemeMode.light : ThemeMode.dark;

  /// The opposite [ThemeMode].
  ThemeMode get opposite => this == dark ? ThemeMode.light : ThemeMode.dark;

  /// The opposite [EnhancedThemeMode].
  EnhancedThemeMode get oppositeEnhanced => this == dark ? light : dark;

  /// Returns the [EhnancedThemeMode] of the current brightness.
  static EnhancedThemeMode fromBrightness(final BuildContext context) =>
      context.isDarkMode ? dark : light;

  /// Transforms a [String] to a valid [EnhancedThemeMode].
  static EnhancedThemeMode of(final String? name) {
    if (name == null || name.isEmpty) {
      throw StateError('Theme mode name must a non-empty non-null value.');
    }
    switch (name.toLowerCase()) {
      case 'light':
        return light;
      case 'dark':
        return dark;
    }
    throw UnsupportedError('Theme mode must either be light or dark.');
  }
}

/// A named theme configuration with an [EnhancedThemeMode].
abstract class EnhancedTheme {
  const EnhancedTheme();

  /// Theme's name.
  abstract final ColorThemeName name;

  /// Theme mode.
  abstract final EnhancedThemeMode mode;

  /// Theme's defined groups of [EnhancedColor]s.
  abstract final ColorGroupBucket groups;

  /// Theme's ungrouped [EnhancedColor]s.
  abstract final ColorGroup ungroupedColors;
}

extension _Utils on String {
  /// Tranforms a [String] to camelCase.
  String get toCamelCase => splitMapJoin(
        '[-_]',
        onMatch: (final Match match) => match.input
            .substring(
              match.start,
              match.end,
            )
            .toLowerCase()
            .toFirstCapital,
      ).toFirstLower;

  /// Tranforms a [String] to PascalCase.
  String get toPascalCase => toCamelCase.toFirstCapital;

  /// Capitalizes string's first character.
  String get toFirstCapital => replaceRange(
        0,
        1,
        substring(0, 1).toUpperCase(),
      );

  /// Lowers string's first character.
  String get toFirstLower => replaceRange(
        0,
        1,
        substring(0, 1).toLowerCase(),
      );
}

enum UtilitiesExampleTheme<T extends AllTagsAndGroupsEnhancedTheme> {
  rustLightTheme<RustLightTheme>(
    RustLightTheme(
      name: 'rust',
      mode: EnhancedThemeMode.light,
      groups: <ColorGroup>{
        RustLightThemeCodeThemeGroup(
          'codeTheme',
          colors: <ColorName, EnhancedColor>{
            'portGore': EnhancedColor(
              0xff1a1f4a,
              name: 'portGore',
              tags: <ColorTag>{
                'base',
              },
            ),
            'purple': EnhancedColor(
              0xff7b00a7,
              name: 'purple',
              tags: <ColorTag>{
                'objectClass',
              },
            ),
            'woodland': EnhancedColor(
              0xff546428,
              name: 'woodland',
              tags: <ColorTag>{
                'comment',
              },
            ),
            'romanCoffeeBrown': EnhancedColor(
              0xff795548,
              name: 'romanCoffeeBrown',
              tags: <ColorTag>{
                'constant',
              },
            ),
            'mediumRedViolet': EnhancedColor(
              0xffaa228e,
              name: 'mediumRedViolet',
              tags: <ColorTag>{
                'keyword',
              },
            ),
            'indigo': EnhancedColor(
              0xff485ec3,
              name: 'indigo',
              tags: <ColorTag>{
                'number',
              },
            ),
            'bigStone': EnhancedColor(
              0xff131736,
              name: 'bigStone',
              tags: <ColorTag>{
                'punctuation',
              },
            ),
            'oliveDrab': EnhancedColor(
              0xff6b9b26,
              name: 'oliveDrab',
              tags: <ColorTag>{
                'string',
              },
            ),
          },
        ),
        RustLightThemeThemeDataGroup(
          'themeData',
          colors: <ColorName, EnhancedColor>{
            'rustOpacity100': EnhancedColor(
              0xffa6400f,
              name: 'rustOpacity100',
              tags: <ColorTag>{
                'primaryColor',
                'indicatorColor',
              },
            ),
            'sealBrownOpacity100': EnhancedColor(
              0xff632609,
              name: 'sealBrownOpacity100',
              tags: <ColorTag>{
                'primaryDark',
              },
            ),
            'antiqueBrassOpacity100': EnhancedColor(
              0xffc98c6f,
              name: 'antiqueBrassOpacity100',
              tags: <ColorTag>{
                'primaryLight',
              },
            ),
            'pantoneOpacity100': EnhancedColor(
              0xffedd8cf,
              name: 'pantoneOpacity100',
              tags: <ColorTag>{
                'secondaryHeader',
              },
            ),
            'alabasterOpacity100': EnhancedColor(
              0xfff4eae5,
              name: 'alabasterOpacity100',
              tags: <ColorTag>{
                'canvas',
              },
            ),
            'potPourriOpacity100': EnhancedColor(
              0xfff2e3dc,
              name: 'potPourriOpacity100',
              tags: <ColorTag>{
                'card',
                'dialog',
              },
            ),
            'culturedOpacity100': EnhancedColor(
              0xfffaf6f3,
              name: 'culturedOpacity100',
              tags: <ColorTag>{
                'scaffoldBackground',
              },
            ),
            'blackOpacity12': EnhancedColor(
              0x1f000000,
              name: 'blackOpacity12',
              tags: <ColorTag>{
                'dividerColor',
              },
            ),
            'cafeNoirOpacity37': EnhancedColor(
              0x5e4e372b,
              name: 'cafeNoirOpacity37',
              tags: <ColorTag>{
                'disabledColor',
              },
            ),
            'brownSugarOpacity10': EnhancedColor(
              0x19bc6f4b,
              name: 'brownSugarOpacity10',
              tags: <ColorTag>{
                'hoverColor',
                'highlightColor',
              },
            ),
            'copperRedOpacity30': EnhancedColor(
              0x4cc07856,
              name: 'copperRedOpacity30',
              tags: <ColorTag>{
                'focusColor',
              },
            ),
            'brownCrayolaOpacity20': EnhancedColor(
              0x33b0572c,
              name: 'brownCrayolaOpacity20',
              tags: <ColorTag>{
                'splashColor',
              },
            ),
            'blackOpacity100': EnhancedColor(
              0xff000000,
              name: 'blackOpacity100',
              tags: <ColorTag>{
                'shadowColor',
              },
            ),
            'blackOpacity60': EnhancedColor(
              0x99000000,
              name: 'blackOpacity60',
              tags: <ColorTag>{
                'hintColor',
              },
            ),
            'blackOpacity54': EnhancedColor(
              0x8a000000,
              name: 'blackOpacity54',
              tags: <ColorTag>{
                'unselectedWidget',
              },
            ),
          },
        ),
        RustLightThemeComponentsAndInteractionsGroup(
          'componentsAndInteractions',
          colors: <ColorName, EnhancedColor>{
            'potPourriOpacity100': EnhancedColor(
              0xfff2e3dc,
              name: 'potPourriOpacity100',
              tags: <ColorTag>{
                'elevatedButton',
                'outlinedButton',
                'textButton',
                'dialogBackground',
                'card',
              },
            ),
            'rustOpacity100': EnhancedColor(
              0xffa6400f,
              name: 'rustOpacity100',
              tags: <ColorTag>{
                'filledButton',
                'toggleButtons',
                'checkbox',
                'radio',
                'chips',
                'inputDecorator',
                'tabBarItem',
                'tabBarIndicator',
                'bottomNavigationBarSelected',
                'navigationBarSelected',
                'navigationRailSelected',
              },
            ),
            'opalOpacity100': EnhancedColor(
              0xffa3c4c7,
              name: 'opalOpacity100',
              tags: <ColorTag>{
                'tonalButton',
              },
            ),
            'mistyRoseOpacity100': EnhancedColor(
              0xfff9e9e1,
              name: 'mistyRoseOpacity100',
              tags: <ColorTag>{
                'toggleSwitch',
              },
            ),
            'tanOpacity100': EnhancedColor(
              0xffd1aa99,
              name: 'tanOpacity100',
              tags: <ColorTag>{
                'floatingActionButton',
              },
            ),
            'sealBrownOpacity100': EnhancedColor(
              0xff632609,
              name: 'sealBrownOpacity100',
              tags: <ColorTag>{
                'circleAvatar',
              },
            ),
            'brownChocolateOpacity100': EnhancedColor(
              0xff532240,
              name: 'brownChocolateOpacity100',
              tags: <ColorTag>{
                'tooltip',
              },
            ),
            'potPourriOpacity98': EnhancedColor(
              0xfaf2e3dc,
              name: 'potPourriOpacity98',
              tags: <ColorTag>{
                'appBar',
              },
            ),
            'darkBrownOpacity93': EnhancedColor(
              0xed693922,
              name: 'darkBrownOpacity93',
              tags: <ColorTag>{
                'snackBarBackground',
              },
            ),
            'alabasterOpacity98': EnhancedColor(
              0xfaf4eae5,
              name: 'alabasterOpacity98',
              tags: <ColorTag>{
                'bottomNavigationBarBackground',
              },
            ),
            'champagnePinkOpacity100': EnhancedColor(
              0xffebd5cb,
              name: 'champagnePinkOpacity100',
              tags: <ColorTag>{
                'navigationBarBackground',
              },
            ),
            'rustOpacity24': EnhancedColor(
              0x3da6400f,
              name: 'rustOpacity24',
              tags: <ColorTag>{
                'navigationBarIndicator',
                'navigationRailIndicator',
              },
            ),
            'alabasterOpacity100': EnhancedColor(
              0xfff4eae5,
              name: 'alabasterOpacity100',
              tags: <ColorTag>{
                'navigationRailBackground',
              },
            ),
            'rootBeerOpacity95': EnhancedColor(
              0xf22a1003,
              name: 'rootBeerOpacity95',
              tags: <ColorTag>{
                'textTheme',
              },
            ),
            'fantasyOpacity100': EnhancedColor(
              0xfff7eeea,
              name: 'fantasyOpacity100',
              tags: <ColorTag>{
                'primaryTextTheme',
              },
            ),
            'cafeNoirOpacity37': EnhancedColor(
              0x5e4e372b,
              name: 'cafeNoirOpacity37',
              tags: <ColorTag>{
                'disabledColor',
              },
            ),
            'brownSugarOpacity10': EnhancedColor(
              0x19bc6f4b,
              name: 'brownSugarOpacity10',
              tags: <ColorTag>{
                'hoverColor',
                'highlightColor',
              },
            ),
            'copperRedOpacity30': EnhancedColor(
              0x4cc07856,
              name: 'copperRedOpacity30',
              tags: <ColorTag>{
                'focusColor',
              },
            ),
            'brownCrayolaOpacity20': EnhancedColor(
              0x33b0572c,
              name: 'brownCrayolaOpacity20',
              tags: <ColorTag>{
                'splashColor',
              },
            ),
          },
        ),
      },
      ungroupedColors: ColorGroup(
        'ungrouped',
        colors: <ColorName, EnhancedColor>{
          'rustOpacity100': EnhancedColor(
            0xffa6400f,
            name: 'rustOpacity100',
            tags: <ColorTag>{
              'primary',
              'surfaceTint',
            },
          ),
          'mistyRoseOpacity100': EnhancedColor(
            0xfff9e9e1,
            name: 'mistyRoseOpacity100',
            tags: <ColorTag>{
              'onPrimary',
            },
          ),
          'tanOpacity100': EnhancedColor(
            0xffd1aa99,
            name: 'tanOpacity100',
            tags: <ColorTag>{
              'primaryContainer',
            },
          ),
          'masalaOpacity100': EnhancedColor(
            0xff473b36,
            name: 'masalaOpacity100',
            tags: <ColorTag>{
              'onPrimaryContainer',
            },
          ),
          'edenOpacity100': EnhancedColor(
            0xff185358,
            name: 'edenOpacity100',
            tags: <ColorTag>{
              'secondary',
            },
          ),
          'mysticOpacity100': EnhancedColor(
            0xffe2ecec,
            name: 'mysticOpacity100',
            tags: <ColorTag>{
              'onSecondary',
            },
          ),
          'opalOpacity100': EnhancedColor(
            0xffa3c4c7,
            name: 'opalOpacity100',
            tags: <ColorTag>{
              'secondaryContainer',
            },
          ),
          'capeCodeOpacity100': EnhancedColor(
            0xff394344,
            name: 'capeCodeOpacity100',
            tags: <ColorTag>{
              'onSecondaryContainer',
            },
          ),
          'blueDianneOpacity100': EnhancedColor(
            0xff144447,
            name: 'blueDianneOpacity100',
            tags: <ColorTag>{
              'tertiary',
            },
          ),
          'platinumOpacity100': EnhancedColor(
            0xffe2e9ea,
            name: 'platinumOpacity100',
            tags: <ColorTag>{
              'onTertiary',
            },
          ),
          'halfBakedOpacity100': EnhancedColor(
            0xff7fc0c4,
            name: 'halfBakedOpacity100',
            tags: <ColorTag>{
              'tertiaryContainer',
            },
          ),
          'outerSpaceOpacity100': EnhancedColor(
            0xff2e4243,
            name: 'outerSpaceOpacity100',
            tags: <ColorTag>{
              'onTertiaryContainer',
            },
          ),
          'shirazOpacity100': EnhancedColor(
            0xffb00020,
            name: 'shirazOpacity100',
            tags: <ColorTag>{
              'error',
            },
          ),
          'wePeepOpacity100': EnhancedColor(
            0xfffadfe4,
            name: 'wePeepOpacity100',
            tags: <ColorTag>{
              'onError',
            },
          ),
          'pigPinkOpacity100': EnhancedColor(
            0xfffcd8df,
            name: 'pigPinkOpacity100',
            tags: <ColorTag>{
              'errorContainer',
            },
          ),
          'emperorOpacity100': EnhancedColor(
            0xff504a4c,
            name: 'emperorOpacity100',
            tags: <ColorTag>{
              'onErrorContainer',
            },
          ),
          'alabasterOpacity100': EnhancedColor(
            0xfff4eae5,
            name: 'alabasterOpacity100',
            tags: <ColorTag>{
              'background',
            },
          ),
          'duneOpacity100': EnhancedColor(
            0xff262423,
            name: 'duneOpacity100',
            tags: <ColorTag>{
              'onBackground',
            },
          ),
          'potPourriOpacity100': EnhancedColor(
            0xfff2e3dc,
            name: 'potPourriOpacity100',
            tags: <ColorTag>{
              'surface',
            },
          ),
          'jetOpacity100': EnhancedColor(
            0xff383533,
            name: 'jetOpacity100',
            tags: <ColorTag>{
              'onSurface',
            },
          ),
          'champagnePinkOpacity100': EnhancedColor(
            0xffebd5cb,
            name: 'champagnePinkOpacity100',
            tags: <ColorTag>{
              'surfaceVariant',
            },
          ),
          'kabulOpacity100': EnhancedColor(
            0xff524b47,
            name: 'kabulOpacity100',
            tags: <ColorTag>{
              'onSurfaceVariant',
            },
          ),
          'sandDuneOpacity100': EnhancedColor(
            0xff766f6c,
            name: 'sandDuneOpacity100',
            tags: <ColorTag>{
              'outline',
            },
          ),
          'silverRustOpacity100': EnhancedColor(
            0xffc0bdbb,
            name: 'silverRustOpacity100',
            tags: <ColorTag>{
              'outlineVariant',
            },
          ),
          'blackOpacity100': EnhancedColor(
            0xff000000,
            name: 'blackOpacity100',
            tags: <ColorTag>{
              'shadow',
              'scrim',
            },
          ),
          'nightRiderOpacity100': EnhancedColor(
            0xff261710,
            name: 'nightRiderOpacity100',
            tags: <ColorTag>{
              'inverseSurface',
            },
          ),
          'chineseSilverOpacity100': EnhancedColor(
            0xffcbc8c6,
            name: 'chineseSilverOpacity100',
            tags: <ColorTag>{
              'onInverseSurface',
            },
          ),
          'fleshOpacity100': EnhancedColor(
            0xffffc7a8,
            name: 'fleshOpacity100',
            tags: <ColorTag>{
              'inversePrimary',
            },
          ),
        },
      ),
    ),
  ),
  rustDarkTheme<RustDarkTheme>(
    RustDarkTheme(
      name: 'rust',
      mode: EnhancedThemeMode.dark,
      groups: <ColorGroup>{
        RustDarkThemeCodeThemeGroup(
          'codeTheme',
          colors: <ColorName, EnhancedColor>{
            'janna': EnhancedColor(
              0xfff4edd3,
              name: 'janna',
              tags: <ColorTag>{
                'base',
              },
            ),
            'silverTree': EnhancedColor(
              0xff55c898,
              name: 'silverTree',
              tags: <ColorTag>{
                'objectClass',
              },
            ),
            'greenSmoke': EnhancedColor(
              0xffa5bc68,
              name: 'greenSmoke',
              tags: <ColorTag>{
                'comment',
              },
            ),
            'lightWisteria': EnhancedColor(
              0xffc69dd4,
              name: 'lightWisteria',
              tags: <ColorTag>{
                'constant',
              },
            ),
            'cornflowerBlue': EnhancedColor(
              0xff74a5f0,
              name: 'cornflowerBlue',
              tags: <ColorTag>{
                'keyword',
              },
            ),
            'coriander': EnhancedColor(
              0xffbecb9e,
              name: 'coriander',
              tags: <ColorTag>{
                'number',
              },
            ),
            'parchment': EnhancedColor(
              0xffefe8d1,
              name: 'parchment',
              tags: <ColorTag>{
                'punctuation',
              },
            ),
            'tumbleweed': EnhancedColor(
              0xffd4a286,
              name: 'tumbleweed',
              tags: <ColorTag>{
                'string',
              },
            ),
          },
        ),
        RustDarkThemeThemeDataGroup(
          'themeData',
          colors: <ColorName, EnhancedColor>{
            'pastelPinkOpacity100': EnhancedColor(
              0xffd3ae9d,
              name: 'pastelPinkOpacity100',
              tags: <ColorTag>{
                'primaryColor',
                'indicatorColor',
              },
            ),
            'deepTaupeOpacity100': EnhancedColor(
              0xff746056,
              name: 'deepTaupeOpacity100',
              tags: <ColorTag>{
                'primaryDark',
              },
            ),
            'dustStormOpacity100': EnhancedColor(
              0xffe2cabf,
              name: 'dustStormOpacity100',
              tags: <ColorTag>{
                'primaryLight',
              },
            ),
            'oliveDrabCamouflageOpacity100': EnhancedColor(
              0xff54453e,
              name: 'oliveDrabCamouflageOpacity100',
              tags: <ColorTag>{
                'secondaryHeader',
              },
            ),
            'cocoaBrownOpacity100': EnhancedColor(
              0xff231f1d,
              name: 'cocoaBrownOpacity100',
              tags: <ColorTag>{
                'canvas',
              },
            ),
            'pineTreeOpacity100': EnhancedColor(
              0xff2d2725,
              name: 'pineTreeOpacity100',
              tags: <ColorTag>{
                'card',
                'dialog',
              },
            ),
            'eerieBlackOpacity100': EnhancedColor(
              0xff1b1918,
              name: 'eerieBlackOpacity100',
              tags: <ColorTag>{
                'scaffoldBackground',
              },
            ),
            'whiteOpacity12': EnhancedColor(
              0x1fffffff,
              name: 'whiteOpacity12',
              tags: <ColorTag>{
                'dividerColor',
              },
            ),
            'pastelGrayOpacity37': EnhancedColor(
              0x5ecec6c1,
              name: 'pastelGrayOpacity37',
              tags: <ColorTag>{
                'disabledColor',
              },
            ),
            'desertSandOpacity10': EnhancedColor(
              0x19dec2b5,
              name: 'desertSandOpacity10',
              tags: <ColorTag>{
                'hoverColor',
                'highlightColor',
              },
            ),
            'boneOpacity30': EnhancedColor(
              0x4ce0c6ba,
              name: 'boneOpacity30',
              tags: <ColorTag>{
                'focusColor',
              },
            ),
            'darkVanillaOpacity20': EnhancedColor(
              0x33d8b7a8,
              name: 'darkVanillaOpacity20',
              tags: <ColorTag>{
                'splashColor',
              },
            ),
            'blackOpacity100': EnhancedColor(
              0xff000000,
              name: 'blackOpacity100',
              tags: <ColorTag>{
                'shadowColor',
              },
            ),
            'whiteOpacity60': EnhancedColor(
              0x99ffffff,
              name: 'whiteOpacity60',
              tags: <ColorTag>{
                'hintColor',
              },
            ),
            'whiteOpacity70': EnhancedColor(
              0xb3ffffff,
              name: 'whiteOpacity70',
              tags: <ColorTag>{
                'unselectedWidget',
              },
            ),
          },
        ),
        RustDarkThemeComponentsAndInteractionsGroup(
          'componentsAndInteractions',
          colors: <ColorName, EnhancedColor>{
            'pineTreeOpacity100': EnhancedColor(
              0xff2d2725,
              name: 'pineTreeOpacity100',
              tags: <ColorTag>{
                'elevatedButton',
                'outlinedButton',
                'textButton',
                'dialogBackground',
                'card',
              },
            ),
            'pastelPinkOpacity100': EnhancedColor(
              0xffd3ae9d,
              name: 'pastelPinkOpacity100',
              tags: <ColorTag>{
                'filledButton',
                'toggleButtons',
                'checkbox',
                'radio',
                'chips',
                'inputDecorator',
                'tabBarItem',
                'tabBarIndicator',
                'bottomNavigationBarSelected',
                'navigationBarSelected',
                'navigationRailSelected',
              },
            ),
            'darkSlateGrayOpacity100': EnhancedColor(
              0xff225b5f,
              name: 'darkSlateGrayOpacity100',
              tags: <ColorTag>{
                'tonalButton',
              },
            ),
            'raisinBlackOpacity100': EnhancedColor(
              0xff282320,
              name: 'raisinBlackOpacity100',
              tags: <ColorTag>{
                'toggleSwitch',
              },
            ),
            'metallicBrownOpacity100': EnhancedColor(
              0xffaa481a,
              name: 'metallicBrownOpacity100',
              tags: <ColorTag>{
                'floatingActionButton',
              },
            ),
            'dustStormOpacity100': EnhancedColor(
              0xffe2cabf,
              name: 'dustStormOpacity100',
              tags: <ColorTag>{
                'circleAvatar',
              },
            ),
            'whiteChocolateOpacity100': EnhancedColor(
              0xffeddfd8,
              name: 'whiteChocolateOpacity100',
              tags: <ColorTag>{
                'tooltip',
              },
            ),
            'pineTreeOpacity98': EnhancedColor(
              0xfa2d2725,
              name: 'pineTreeOpacity98',
              tags: <ColorTag>{
                'appBar',
              },
            ),
            'paleSilverOpacity95': EnhancedColor(
              0xf2cfc0b9,
              name: 'paleSilverOpacity95',
              tags: <ColorTag>{
                'snackBarBackground',
              },
            ),
            'cocoaBrownOpacity98': EnhancedColor(
              0xfa231f1d,
              name: 'cocoaBrownOpacity98',
              tags: <ColorTag>{
                'bottomNavigationBarBackground',
              },
            ),
            'blackCoffeeOpacity100': EnhancedColor(
              0xff3a322e,
              name: 'blackCoffeeOpacity100',
              tags: <ColorTag>{
                'navigationBarBackground',
              },
            ),
            'pastelPinkOpacity24': EnhancedColor(
              0x3dd3ae9d,
              name: 'pastelPinkOpacity24',
              tags: <ColorTag>{
                'navigationBarIndicator',
                'navigationRailIndicator',
              },
            ),
            'cocoaBrownOpacity100': EnhancedColor(
              0xff231f1d,
              name: 'cocoaBrownOpacity100',
              tags: <ColorTag>{
                'navigationRailBackground',
              },
            ),
            'isabellineOpacity100': EnhancedColor(
              0xfff6eeeb,
              name: 'isabellineOpacity100',
              tags: <ColorTag>{
                'textTheme',
              },
            ),
            'vampireBlackOpacity95': EnhancedColor(
              0xf2090807,
              name: 'vampireBlackOpacity95',
              tags: <ColorTag>{
                'primaryTextTheme',
              },
            ),
            'pastelGrayOpacity37': EnhancedColor(
              0x5ecec6c1,
              name: 'pastelGrayOpacity37',
              tags: <ColorTag>{
                'disabledColor',
              },
            ),
            'desertSandOpacity10': EnhancedColor(
              0x19dec2b5,
              name: 'desertSandOpacity10',
              tags: <ColorTag>{
                'hoverColor',
                'highlightColor',
              },
            ),
            'boneOpacity30': EnhancedColor(
              0x4ce0c6ba,
              name: 'boneOpacity30',
              tags: <ColorTag>{
                'focusColor',
              },
            ),
            'darkVanillaOpacity20': EnhancedColor(
              0x33d8b7a8,
              name: 'darkVanillaOpacity20',
              tags: <ColorTag>{
                'splashColor',
              },
            ),
          },
        ),
      },
      ungroupedColors: ColorGroup(
        'ungrouped',
        colors: <ColorName, EnhancedColor>{
          'eunryOpacity100': EnhancedColor(
            0xffd3ae9d,
            name: 'eunryOpacity100',
            tags: <ColorTag>{
              'primary',
              'surfaceTint',
            },
          ),
          'zeusOpacity100': EnhancedColor(
            0xff282320,
            name: 'zeusOpacity100',
            tags: <ColorTag>{
              'onPrimary',
            },
          ),
          'metallicBrownOpacity100': EnhancedColor(
            0xffaa481a,
            name: 'metallicBrownOpacity100',
            tags: <ColorTag>{
              'primaryContainer',
            },
          ),
          'almondOpacity100': EnhancedColor(
            0xfff5d7c8,
            name: 'almondOpacity100',
            tags: <ColorTag>{
              'onPrimaryContainer',
            },
          ),
          'towerGrayOpacity100': EnhancedColor(
            0xffa7c6c9,
            name: 'towerGrayOpacity100',
            tags: <ColorTag>{
              'secondary',
            },
          ),
          'darkGunmetalOpacity100': EnhancedColor(
            0xff222727,
            name: 'darkGunmetalOpacity100',
            tags: <ColorTag>{
              'onSecondary',
            },
          ),
          'darkSlateGrayOpacity100': EnhancedColor(
            0xff225b5f,
            name: 'darkSlateGrayOpacity100',
            tags: <ColorTag>{
              'secondaryContainer',
            },
          ),
          'geyserOpacity100': EnhancedColor(
            0xffcbddde,
            name: 'geyserOpacity100',
            tags: <ColorTag>{
              'onSecondaryContainer',
            },
          ),
          'darkSkyBlueOpacity100': EnhancedColor(
            0xff85c2c6,
            name: 'darkSkyBlueOpacity100',
            tags: <ColorTag>{
              'tertiary',
            },
          ),
          'charlestonGreenOpacity100': EnhancedColor(
            0xff1c2627,
            name: 'charlestonGreenOpacity100',
            tags: <ColorTag>{
              'onTertiary',
            },
          ),
          'japaneseIndigoOpacity100': EnhancedColor(
            0xff1f4c4f,
            name: 'japaneseIndigoOpacity100',
            tags: <ColorTag>{
              'tertiaryContainer',
            },
          ),
          'tiaraOpacity100': EnhancedColor(
            0xffcad8d9,
            name: 'tiaraOpacity100',
            tags: <ColorTag>{
              'onTertiaryContainer',
            },
          ),
          'cranberryOpacity100': EnhancedColor(
            0xffcf6679,
            name: 'cranberryOpacity100',
            tags: <ColorTag>{
              'error',
            },
          ),
          'craterBrownOpacity100': EnhancedColor(
            0xff28181a,
            name: 'craterBrownOpacity100',
            tags: <ColorTag>{
              'onError',
            },
          ),
          'nightShadzOpacity100': EnhancedColor(
            0xffb1384e,
            name: 'nightShadzOpacity100',
            tags: <ColorTag>{
              'errorContainer',
            },
          ),
          'azaleaOpacity100': EnhancedColor(
            0xfff8d2d9,
            name: 'azaleaOpacity100',
            tags: <ColorTag>{
              'onErrorContainer',
            },
          ),
          'cocoaBrownOpacity100': EnhancedColor(
            0xff231f1d,
            name: 'cocoaBrownOpacity100',
            tags: <ColorTag>{
              'background',
            },
          ),
          'altoOpacity100': EnhancedColor(
            0xffdcdbdb,
            name: 'altoOpacity100',
            tags: <ColorTag>{
              'onBackground',
            },
          ),
          'pineTreeOpacity100': EnhancedColor(
            0xff2d2725,
            name: 'pineTreeOpacity100',
            tags: <ColorTag>{
              'surface',
            },
          ),
          'swirlOpacity100': EnhancedColor(
            0xffcdcccb,
            name: 'swirlOpacity100',
            tags: <ColorTag>{
              'onSurface',
            },
          ),
          'blackCoffeeOpacity100': EnhancedColor(
            0xff3a322f,
            name: 'blackCoffeeOpacity100',
            tags: <ColorTag>{
              'surfaceVariant',
            },
          ),
          'nobelOpacity100': EnhancedColor(
            0xffb9b6b5,
            name: 'nobelOpacity100',
            tags: <ColorTag>{
              'onSurfaceVariant',
            },
          ),
          'grayOpacity100': EnhancedColor(
            0xff918d8d,
            name: 'grayOpacity100',
            tags: <ColorTag>{
              'outline',
            },
          ),
          'mineShaftOpacity100': EnhancedColor(
            0xff434242,
            name: 'mineShaftOpacity100',
            tags: <ColorTag>{
              'outlineVariant',
            },
          ),
          'blackOpacity100': EnhancedColor(
            0xff000000,
            name: 'blackOpacity100',
            tags: <ColorTag>{
              'shadow',
              'scrim',
            },
          ),
          'dawnPinkOpacity100': EnhancedColor(
            0xfff8f3f0,
            name: 'dawnPinkOpacity100',
            tags: <ColorTag>{
              'inverseSurface',
            },
          ),
          'tuataraOpacity100': EnhancedColor(
            0xff3a3938,
            name: 'tuataraOpacity100',
            tags: <ColorTag>{
              'onInverseSurface',
            },
          ),
          'pineConeOpacity100': EnhancedColor(
            0xff74625a,
            name: 'pineConeOpacity100',
            tags: <ColorTag>{
              'inversePrimary',
            },
          ),
        },
      ),
    ),
  );

  const UtilitiesExampleTheme(final AllTagsAndGroupsEnhancedTheme theme)
      : _theme = theme;

  final AllTagsAndGroupsEnhancedTheme _theme;

  T get themeData => _theme as T;
}

class RustLightTheme extends RustEnhancedTheme {
  const RustLightTheme({
    required super.name,
    required super.mode,
    required super.groups,
    required super.ungroupedColors,
  }) : super();

  @override
  EnhancedColor get primary => ungroupedColors.colors['rustOpacity100']!;

  @override
  EnhancedColor get surfaceTint => ungroupedColors.colors['rustOpacity100']!;

  @override
  EnhancedColor get onPrimary => ungroupedColors.colors['mistyRoseOpacity100']!;

  @override
  EnhancedColor get primaryContainer =>
      ungroupedColors.colors['tanOpacity100']!;

  @override
  EnhancedColor get onPrimaryContainer =>
      ungroupedColors.colors['masalaOpacity100']!;

  @override
  EnhancedColor get secondary => ungroupedColors.colors['edenOpacity100']!;

  @override
  EnhancedColor get onSecondary => ungroupedColors.colors['mysticOpacity100']!;

  @override
  EnhancedColor get secondaryContainer =>
      ungroupedColors.colors['opalOpacity100']!;

  @override
  EnhancedColor get onSecondaryContainer =>
      ungroupedColors.colors['capeCodeOpacity100']!;

  @override
  EnhancedColor get tertiary => ungroupedColors.colors['blueDianneOpacity100']!;

  @override
  EnhancedColor get onTertiary => ungroupedColors.colors['platinumOpacity100']!;

  @override
  EnhancedColor get tertiaryContainer =>
      ungroupedColors.colors['halfBakedOpacity100']!;

  @override
  EnhancedColor get onTertiaryContainer =>
      ungroupedColors.colors['outerSpaceOpacity100']!;

  @override
  EnhancedColor get error => ungroupedColors.colors['shirazOpacity100']!;

  @override
  EnhancedColor get onError => ungroupedColors.colors['wePeepOpacity100']!;

  @override
  EnhancedColor get errorContainer =>
      ungroupedColors.colors['pigPinkOpacity100']!;

  @override
  EnhancedColor get onErrorContainer =>
      ungroupedColors.colors['emperorOpacity100']!;

  @override
  EnhancedColor get background =>
      ungroupedColors.colors['alabasterOpacity100']!;

  @override
  EnhancedColor get onBackground => ungroupedColors.colors['duneOpacity100']!;

  @override
  EnhancedColor get surface => ungroupedColors.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get onSurface => ungroupedColors.colors['jetOpacity100']!;

  @override
  EnhancedColor get surfaceVariant =>
      ungroupedColors.colors['champagnePinkOpacity100']!;

  @override
  EnhancedColor get onSurfaceVariant =>
      ungroupedColors.colors['kabulOpacity100']!;

  @override
  EnhancedColor get outline => ungroupedColors.colors['sandDuneOpacity100']!;

  @override
  EnhancedColor get outlineVariant =>
      ungroupedColors.colors['silverRustOpacity100']!;

  @override
  EnhancedColor get shadow => ungroupedColors.colors['blackOpacity100']!;

  @override
  EnhancedColor get scrim => ungroupedColors.colors['blackOpacity100']!;

  @override
  EnhancedColor get inverseSurface =>
      ungroupedColors.colors['nightRiderOpacity100']!;

  @override
  EnhancedColor get onInverseSurface =>
      ungroupedColors.colors['chineseSilverOpacity100']!;

  @override
  EnhancedColor get inversePrimary =>
      ungroupedColors.colors['fleshOpacity100']!;

  @override
  RustLightThemeCodeThemeGroup get codeTheme =>
      groups.singleWhere((final ColorGroup group) => group.name == 'codeTheme')
          as RustLightThemeCodeThemeGroup;

  @override
  RustLightThemeThemeDataGroup get themeData =>
      groups.singleWhere((final ColorGroup group) => group.name == 'themeData')
          as RustLightThemeThemeDataGroup;

  @override
  RustLightThemeComponentsAndInteractionsGroup get componentsAndInteractions =>
      groups.singleWhere(
        (final ColorGroup group) => group.name == 'componentsAndInteractions',
      ) as RustLightThemeComponentsAndInteractionsGroup;
}

class RustDarkTheme extends RustEnhancedTheme {
  const RustDarkTheme({
    required super.name,
    required super.mode,
    required super.groups,
    required super.ungroupedColors,
  }) : super();

  @override
  EnhancedColor get primary => ungroupedColors.colors['eunryOpacity100']!;

  @override
  EnhancedColor get surfaceTint => ungroupedColors.colors['eunryOpacity100']!;

  @override
  EnhancedColor get onPrimary => ungroupedColors.colors['zeusOpacity100']!;

  @override
  EnhancedColor get primaryContainer =>
      ungroupedColors.colors['metallicBrownOpacity100']!;

  @override
  EnhancedColor get onPrimaryContainer =>
      ungroupedColors.colors['almondOpacity100']!;

  @override
  EnhancedColor get secondary => ungroupedColors.colors['towerGrayOpacity100']!;

  @override
  EnhancedColor get onSecondary =>
      ungroupedColors.colors['darkGunmetalOpacity100']!;

  @override
  EnhancedColor get secondaryContainer =>
      ungroupedColors.colors['darkSlateGrayOpacity100']!;

  @override
  EnhancedColor get onSecondaryContainer =>
      ungroupedColors.colors['geyserOpacity100']!;

  @override
  EnhancedColor get tertiary =>
      ungroupedColors.colors['darkSkyBlueOpacity100']!;

  @override
  EnhancedColor get onTertiary =>
      ungroupedColors.colors['charlestonGreenOpacity100']!;

  @override
  EnhancedColor get tertiaryContainer =>
      ungroupedColors.colors['japaneseIndigoOpacity100']!;

  @override
  EnhancedColor get onTertiaryContainer =>
      ungroupedColors.colors['tiaraOpacity100']!;

  @override
  EnhancedColor get error => ungroupedColors.colors['cranberryOpacity100']!;

  @override
  EnhancedColor get onError => ungroupedColors.colors['craterBrownOpacity100']!;

  @override
  EnhancedColor get errorContainer =>
      ungroupedColors.colors['nightShadzOpacity100']!;

  @override
  EnhancedColor get onErrorContainer =>
      ungroupedColors.colors['azaleaOpacity100']!;

  @override
  EnhancedColor get background =>
      ungroupedColors.colors['cocoaBrownOpacity100']!;

  @override
  EnhancedColor get onBackground => ungroupedColors.colors['altoOpacity100']!;

  @override
  EnhancedColor get surface => ungroupedColors.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get onSurface => ungroupedColors.colors['swirlOpacity100']!;

  @override
  EnhancedColor get surfaceVariant =>
      ungroupedColors.colors['blackCoffeeOpacity100']!;

  @override
  EnhancedColor get onSurfaceVariant =>
      ungroupedColors.colors['nobelOpacity100']!;

  @override
  EnhancedColor get outline => ungroupedColors.colors['grayOpacity100']!;

  @override
  EnhancedColor get outlineVariant =>
      ungroupedColors.colors['mineShaftOpacity100']!;

  @override
  EnhancedColor get shadow => ungroupedColors.colors['blackOpacity100']!;

  @override
  EnhancedColor get scrim => ungroupedColors.colors['blackOpacity100']!;

  @override
  EnhancedColor get inverseSurface =>
      ungroupedColors.colors['dawnPinkOpacity100']!;

  @override
  EnhancedColor get onInverseSurface =>
      ungroupedColors.colors['tuataraOpacity100']!;

  @override
  EnhancedColor get inversePrimary =>
      ungroupedColors.colors['pineConeOpacity100']!;

  @override
  RustDarkThemeCodeThemeGroup get codeTheme =>
      groups.singleWhere((final ColorGroup group) => group.name == 'codeTheme')
          as RustDarkThemeCodeThemeGroup;

  @override
  RustDarkThemeThemeDataGroup get themeData =>
      groups.singleWhere((final ColorGroup group) => group.name == 'themeData')
          as RustDarkThemeThemeDataGroup;

  @override
  RustDarkThemeComponentsAndInteractionsGroup get componentsAndInteractions =>
      groups.singleWhere(
        (final ColorGroup group) => group.name == 'componentsAndInteractions',
      ) as RustDarkThemeComponentsAndInteractionsGroup;
}

mixin AllTagsAndGroups {
  EnhancedColor get primary => throw UnsupportedError(
        'primary is not supported by the current theme.',
      );

  EnhancedColor get surfaceTint => throw UnsupportedError(
        'surfaceTint is not supported by the current theme.',
      );

  EnhancedColor get onPrimary => throw UnsupportedError(
        'onPrimary is not supported by the current theme.',
      );

  EnhancedColor get primaryContainer => throw UnsupportedError(
        'primaryContainer is not supported by the current theme.',
      );

  EnhancedColor get onPrimaryContainer => throw UnsupportedError(
        'onPrimaryContainer is not supported by the current theme.',
      );

  EnhancedColor get secondary => throw UnsupportedError(
        'secondary is not supported by the current theme.',
      );

  EnhancedColor get onSecondary => throw UnsupportedError(
        'onSecondary is not supported by the current theme.',
      );

  EnhancedColor get secondaryContainer => throw UnsupportedError(
        'secondaryContainer is not supported by the current theme.',
      );

  EnhancedColor get onSecondaryContainer => throw UnsupportedError(
        'onSecondaryContainer is not supported by the current theme.',
      );

  EnhancedColor get tertiary => throw UnsupportedError(
        'tertiary is not supported by the current theme.',
      );

  EnhancedColor get onTertiary => throw UnsupportedError(
        'onTertiary is not supported by the current theme.',
      );

  EnhancedColor get tertiaryContainer => throw UnsupportedError(
        'tertiaryContainer is not supported by the current theme.',
      );

  EnhancedColor get onTertiaryContainer => throw UnsupportedError(
        'onTertiaryContainer is not supported by the current theme.',
      );

  EnhancedColor get error => throw UnsupportedError(
        'error is not supported by the current theme.',
      );

  EnhancedColor get onError => throw UnsupportedError(
        'onError is not supported by the current theme.',
      );

  EnhancedColor get errorContainer => throw UnsupportedError(
        'errorContainer is not supported by the current theme.',
      );

  EnhancedColor get onErrorContainer => throw UnsupportedError(
        'onErrorContainer is not supported by the current theme.',
      );

  EnhancedColor get background => throw UnsupportedError(
        'background is not supported by the current theme.',
      );

  EnhancedColor get onBackground => throw UnsupportedError(
        'onBackground is not supported by the current theme.',
      );

  EnhancedColor get surface => throw UnsupportedError(
        'surface is not supported by the current theme.',
      );

  EnhancedColor get onSurface => throw UnsupportedError(
        'onSurface is not supported by the current theme.',
      );

  EnhancedColor get surfaceVariant => throw UnsupportedError(
        'surfaceVariant is not supported by the current theme.',
      );

  EnhancedColor get onSurfaceVariant => throw UnsupportedError(
        'onSurfaceVariant is not supported by the current theme.',
      );

  EnhancedColor get outline => throw UnsupportedError(
        'outline is not supported by the current theme.',
      );

  EnhancedColor get outlineVariant => throw UnsupportedError(
        'outlineVariant is not supported by the current theme.',
      );

  EnhancedColor get shadow => throw UnsupportedError(
        'shadow is not supported by the current theme.',
      );

  EnhancedColor get scrim => throw UnsupportedError(
        'scrim is not supported by the current theme.',
      );

  EnhancedColor get inverseSurface => throw UnsupportedError(
        'inverseSurface is not supported by the current theme.',
      );

  EnhancedColor get onInverseSurface => throw UnsupportedError(
        'onInverseSurface is not supported by the current theme.',
      );

  EnhancedColor get inversePrimary => throw UnsupportedError(
        'inversePrimary is not supported by the current theme.',
      );
  CodeThemeGroup get codeTheme => throw UnsupportedError(
        'codeTheme is not supported by the current theme.',
      );

  ThemeDataGroup get themeData => throw UnsupportedError(
        'themeData is not supported by the current theme.',
      );

  ComponentsAndInteractionsGroup get componentsAndInteractions =>
      throw UnsupportedError(
        'componentsAndInteractions is not supported by the current theme.',
      );
}

abstract class AllTagsAndGroupsEnhancedTheme extends EnhancedTheme
    with AllTagsAndGroups {
  const AllTagsAndGroupsEnhancedTheme() : super();
}

abstract class RustEnhancedTheme extends AllTagsAndGroupsEnhancedTheme {
  const RustEnhancedTheme({
    required this.name,
    required this.mode,
    required this.groups,
    required this.ungroupedColors,
  }) : super();

  @override
  final ColorThemeName name;

  @override
  final EnhancedThemeMode mode;

  @override
  final ColorGroupBucket groups;

  @override
  final ColorGroup ungroupedColors;

  @override
  CodeThemeGroup get codeTheme => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );
  @override
  ThemeDataGroup get themeData => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );
  @override
  ComponentsAndInteractionsGroup get componentsAndInteractions =>
      throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get primary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get surfaceTint => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onPrimary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get primaryContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onPrimaryContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get secondary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onSecondary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get secondaryContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onSecondaryContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get tertiary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onTertiary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get tertiaryContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onTertiaryContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get error => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onError => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get errorContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onErrorContainer => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get background => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get surface => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onSurface => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get surfaceVariant => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onSurfaceVariant => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get outline => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get outlineVariant => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get shadow => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get scrim => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get inverseSurface => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get onInverseSurface => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  @override
  EnhancedColor get inversePrimary => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );
}

abstract class CodeThemeGroup extends ColorGroup {
  const CodeThemeGroup(
    super.name, {
    super.colors,
  }) : super();

  EnhancedColor get base => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get objectClass => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get comment => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get constant => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get keyword => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get number => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get punctuation => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get string => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );
}

class RustLightThemeCodeThemeGroup extends CodeThemeGroup {
  const RustLightThemeCodeThemeGroup(
    super.name, {
    super.colors,
  }) : super();

  @override
  EnhancedColor get base => super.colors['portGore']!;

  @override
  EnhancedColor get objectClass => super.colors['purple']!;

  @override
  EnhancedColor get comment => super.colors['woodland']!;

  @override
  EnhancedColor get constant => super.colors['romanCoffeeBrown']!;

  @override
  EnhancedColor get keyword => super.colors['mediumRedViolet']!;

  @override
  EnhancedColor get number => super.colors['indigo']!;

  @override
  EnhancedColor get punctuation => super.colors['bigStone']!;

  @override
  EnhancedColor get string => super.colors['oliveDrab']!;
}

abstract class ThemeDataGroup extends ColorGroup {
  const ThemeDataGroup(
    super.name, {
    super.colors,
  }) : super();

  EnhancedColor get primaryColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get indicatorColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get primaryDark => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get primaryLight => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get secondaryHeader => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get canvas => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get card => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get dialog => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get scaffoldBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get dividerColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get disabledColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get hoverColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get highlightColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get focusColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get splashColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get shadowColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get hintColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get unselectedWidget => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );
}

class RustLightThemeThemeDataGroup extends ThemeDataGroup {
  const RustLightThemeThemeDataGroup(
    super.name, {
    super.colors,
  }) : super();

  @override
  EnhancedColor get primaryColor => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get indicatorColor => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get primaryDark => super.colors['sealBrownOpacity100']!;

  @override
  EnhancedColor get primaryLight => super.colors['antiqueBrassOpacity100']!;

  @override
  EnhancedColor get secondaryHeader => super.colors['pantoneOpacity100']!;

  @override
  EnhancedColor get canvas => super.colors['alabasterOpacity100']!;

  @override
  EnhancedColor get card => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get dialog => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get scaffoldBackground => super.colors['culturedOpacity100']!;

  @override
  EnhancedColor get dividerColor => super.colors['blackOpacity12']!;

  @override
  EnhancedColor get disabledColor => super.colors['cafeNoirOpacity37']!;

  @override
  EnhancedColor get hoverColor => super.colors['brownSugarOpacity10']!;

  @override
  EnhancedColor get highlightColor => super.colors['brownSugarOpacity10']!;

  @override
  EnhancedColor get focusColor => super.colors['copperRedOpacity30']!;

  @override
  EnhancedColor get splashColor => super.colors['brownCrayolaOpacity20']!;

  @override
  EnhancedColor get shadowColor => super.colors['blackOpacity100']!;

  @override
  EnhancedColor get hintColor => super.colors['blackOpacity60']!;

  @override
  EnhancedColor get unselectedWidget => super.colors['blackOpacity54']!;
}

abstract class ComponentsAndInteractionsGroup extends ColorGroup {
  const ComponentsAndInteractionsGroup(
    super.name, {
    super.colors,
  }) : super();

  EnhancedColor get elevatedButton => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get outlinedButton => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get textButton => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get dialogBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get card => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get filledButton => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get toggleButtons => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get checkbox => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get radio => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get chips => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get inputDecorator => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get tabBarItem => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get tabBarIndicator => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get bottomNavigationBarSelected => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get navigationBarSelected => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get navigationRailSelected => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get tonalButton => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get toggleSwitch => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get floatingActionButton => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get circleAvatar => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get tooltip => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get appBar => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get snackBarBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get bottomNavigationBarBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get navigationBarBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get navigationBarIndicator => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get navigationRailIndicator => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get navigationRailBackground => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get textTheme => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get primaryTextTheme => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get disabledColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get hoverColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get highlightColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get focusColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );

  EnhancedColor get splashColor => throw UnimplementedError(
        'This stub method is not ment to be called directly.',
      );
}

class RustLightThemeComponentsAndInteractionsGroup
    extends ComponentsAndInteractionsGroup {
  const RustLightThemeComponentsAndInteractionsGroup(
    super.name, {
    super.colors,
  }) : super();

  @override
  EnhancedColor get elevatedButton => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get outlinedButton => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get textButton => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get dialogBackground => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get card => super.colors['potPourriOpacity100']!;

  @override
  EnhancedColor get filledButton => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get toggleButtons => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get checkbox => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get radio => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get chips => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get inputDecorator => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get tabBarItem => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get tabBarIndicator => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get bottomNavigationBarSelected =>
      super.colors['rustOpacity100']!;

  @override
  EnhancedColor get navigationBarSelected => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get navigationRailSelected => super.colors['rustOpacity100']!;

  @override
  EnhancedColor get tonalButton => super.colors['opalOpacity100']!;

  @override
  EnhancedColor get toggleSwitch => super.colors['mistyRoseOpacity100']!;

  @override
  EnhancedColor get floatingActionButton => super.colors['tanOpacity100']!;

  @override
  EnhancedColor get circleAvatar => super.colors['sealBrownOpacity100']!;

  @override
  EnhancedColor get tooltip => super.colors['brownChocolateOpacity100']!;

  @override
  EnhancedColor get appBar => super.colors['potPourriOpacity98']!;

  @override
  EnhancedColor get snackBarBackground => super.colors['darkBrownOpacity93']!;

  @override
  EnhancedColor get bottomNavigationBarBackground =>
      super.colors['alabasterOpacity98']!;

  @override
  EnhancedColor get navigationBarBackground =>
      super.colors['champagnePinkOpacity100']!;

  @override
  EnhancedColor get navigationBarIndicator => super.colors['rustOpacity24']!;

  @override
  EnhancedColor get navigationRailIndicator => super.colors['rustOpacity24']!;

  @override
  EnhancedColor get navigationRailBackground =>
      super.colors['alabasterOpacity100']!;

  @override
  EnhancedColor get textTheme => super.colors['rootBeerOpacity95']!;

  @override
  EnhancedColor get primaryTextTheme => super.colors['fantasyOpacity100']!;

  @override
  EnhancedColor get disabledColor => super.colors['cafeNoirOpacity37']!;

  @override
  EnhancedColor get hoverColor => super.colors['brownSugarOpacity10']!;

  @override
  EnhancedColor get highlightColor => super.colors['brownSugarOpacity10']!;

  @override
  EnhancedColor get focusColor => super.colors['copperRedOpacity30']!;

  @override
  EnhancedColor get splashColor => super.colors['brownCrayolaOpacity20']!;
}

class RustDarkThemeCodeThemeGroup extends CodeThemeGroup {
  const RustDarkThemeCodeThemeGroup(
    super.name, {
    super.colors,
  }) : super();

  @override
  EnhancedColor get base => super.colors['janna']!;

  @override
  EnhancedColor get objectClass => super.colors['silverTree']!;

  @override
  EnhancedColor get comment => super.colors['greenSmoke']!;

  @override
  EnhancedColor get constant => super.colors['lightWisteria']!;

  @override
  EnhancedColor get keyword => super.colors['cornflowerBlue']!;

  @override
  EnhancedColor get number => super.colors['coriander']!;

  @override
  EnhancedColor get punctuation => super.colors['parchment']!;

  @override
  EnhancedColor get string => super.colors['tumbleweed']!;
}

class RustDarkThemeThemeDataGroup extends ThemeDataGroup {
  const RustDarkThemeThemeDataGroup(
    super.name, {
    super.colors,
  }) : super();

  @override
  EnhancedColor get primaryColor => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get indicatorColor => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get primaryDark => super.colors['deepTaupeOpacity100']!;

  @override
  EnhancedColor get primaryLight => super.colors['dustStormOpacity100']!;

  @override
  EnhancedColor get secondaryHeader =>
      super.colors['oliveDrabCamouflageOpacity100']!;

  @override
  EnhancedColor get canvas => super.colors['cocoaBrownOpacity100']!;

  @override
  EnhancedColor get card => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get dialog => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get scaffoldBackground => super.colors['eerieBlackOpacity100']!;

  @override
  EnhancedColor get dividerColor => super.colors['whiteOpacity12']!;

  @override
  EnhancedColor get disabledColor => super.colors['pastelGrayOpacity37']!;

  @override
  EnhancedColor get hoverColor => super.colors['desertSandOpacity10']!;

  @override
  EnhancedColor get highlightColor => super.colors['desertSandOpacity10']!;

  @override
  EnhancedColor get focusColor => super.colors['boneOpacity30']!;

  @override
  EnhancedColor get splashColor => super.colors['darkVanillaOpacity20']!;

  @override
  EnhancedColor get shadowColor => super.colors['blackOpacity100']!;

  @override
  EnhancedColor get hintColor => super.colors['whiteOpacity60']!;

  @override
  EnhancedColor get unselectedWidget => super.colors['whiteOpacity70']!;
}

class RustDarkThemeComponentsAndInteractionsGroup
    extends ComponentsAndInteractionsGroup {
  const RustDarkThemeComponentsAndInteractionsGroup(
    super.name, {
    super.colors,
  }) : super();

  @override
  EnhancedColor get elevatedButton => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get outlinedButton => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get textButton => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get dialogBackground => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get card => super.colors['pineTreeOpacity100']!;

  @override
  EnhancedColor get filledButton => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get toggleButtons => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get checkbox => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get radio => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get chips => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get inputDecorator => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get tabBarItem => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get tabBarIndicator => super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get bottomNavigationBarSelected =>
      super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get navigationBarSelected =>
      super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get navigationRailSelected =>
      super.colors['pastelPinkOpacity100']!;

  @override
  EnhancedColor get tonalButton => super.colors['darkSlateGrayOpacity100']!;

  @override
  EnhancedColor get toggleSwitch => super.colors['raisinBlackOpacity100']!;

  @override
  EnhancedColor get floatingActionButton =>
      super.colors['metallicBrownOpacity100']!;

  @override
  EnhancedColor get circleAvatar => super.colors['dustStormOpacity100']!;

  @override
  EnhancedColor get tooltip => super.colors['whiteChocolateOpacity100']!;

  @override
  EnhancedColor get appBar => super.colors['pineTreeOpacity98']!;

  @override
  EnhancedColor get snackBarBackground => super.colors['paleSilverOpacity95']!;

  @override
  EnhancedColor get bottomNavigationBarBackground =>
      super.colors['cocoaBrownOpacity98']!;

  @override
  EnhancedColor get navigationBarBackground =>
      super.colors['blackCoffeeOpacity100']!;

  @override
  EnhancedColor get navigationBarIndicator =>
      super.colors['pastelPinkOpacity24']!;

  @override
  EnhancedColor get navigationRailIndicator =>
      super.colors['pastelPinkOpacity24']!;

  @override
  EnhancedColor get navigationRailBackground =>
      super.colors['cocoaBrownOpacity100']!;

  @override
  EnhancedColor get textTheme => super.colors['isabellineOpacity100']!;

  @override
  EnhancedColor get primaryTextTheme => super.colors['vampireBlackOpacity95']!;

  @override
  EnhancedColor get disabledColor => super.colors['pastelGrayOpacity37']!;

  @override
  EnhancedColor get hoverColor => super.colors['desertSandOpacity10']!;

  @override
  EnhancedColor get highlightColor => super.colors['desertSandOpacity10']!;

  @override
  EnhancedColor get focusColor => super.colors['boneOpacity30']!;

  @override
  EnhancedColor get splashColor => super.colors['darkVanillaOpacity20']!;
}

/// Theme color properties of [AppTheme].
class UtilitiesExampleColors extends ThemeExtension<UtilitiesExampleColors> {
  const UtilitiesExampleColors(this.theme);

  const UtilitiesExampleColors.withLerp({required this.theme});

  final UtilitiesExampleTheme<AllTagsAndGroupsEnhancedTheme> theme;

  @override
  UtilitiesExampleColors copyWith() =>
      throw UnsupportedError('copyWith() is not supported.');

  @override
  UtilitiesExampleColors lerp(
    final UtilitiesExampleColors? other,
    final double t,
  ) {
    if (other is! UtilitiesExampleColors) {
      return this;
    }
    return UtilitiesExampleColors(other.theme);
  }
}

extension CurrentTheme on BuildContext {
  AllTagsAndGroupsEnhancedTheme get currentTheme =>
      Theme.of(this).extension<UtilitiesExampleColors>()!.theme.themeData;
}

class Theming extends StatefulWidget {
  const Theming({
    required this.child,
    GlobalThemeKey super.key = const GlobalThemeKey(),
  });

  @override
  GlobalThemeKey get key => super.key! as GlobalThemeKey;

  final Widget child;

  @override
  State<Theming> createState() => _ThemingState();
}

@Deprecated('Use AppTheme typedef instead.')
typedef UtilitiesExampleEnhancedTheme
    = UtilitiesExampleTheme<AllTagsAndGroupsEnhancedTheme>;
typedef AppTheme = UtilitiesExampleTheme<AllTagsAndGroupsEnhancedTheme>;

class _ThemingState extends State<Theming> {
  late EnhancedThemeMode _enhancedThemeMode;
  late ThemeMode mode;
  AppTheme light = AppTheme.rustLightTheme;
  AppTheme dark = AppTheme.rustDarkTheme;

  @override
  void initState() {
    super.initState();
    _enhancedThemeMode = EnhancedThemeMode.fromBrightness(context);
    mode = _enhancedThemeMode.equivalent;
  }

  @override
  Widget build(final BuildContext context) => ThemeProvider(
        mode: mode,
        light: light,
        dark: dark,
        themingKey: widget.key,
        child: widget.child,
      );

  void changeTheme({final AppTheme? theme, final EnhancedThemeMode? mode}) {
    if (theme != null) {
      setState(
        () {
          final EnhancedThemeMode themeMode = theme.themeData.mode;
          themeMode == EnhancedThemeMode.light ? light = theme : dark = theme;
          this.mode = themeMode.equivalent;
        },
      );
    }
    if (mode != null) {
      setState(() => this.mode = (_enhancedThemeMode = mode).equivalent);
    }
  }

  EnhancedThemeMode get enhancedThemeMode => _enhancedThemeMode;
  set enhancedThemeMode(final EnhancedThemeMode mode) {
    changeTheme(mode: mode);
  }

  void switchTheme() => changeTheme(mode: enhancedThemeMode.oppositeEnhanced);

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppTheme>('dark', dark))
      ..add(DiagnosticsProperty<AppTheme>('light', light))
      ..add(EnumProperty<ThemeMode>('mode', mode))
      ..add(
        EnumProperty<EnhancedThemeMode>(
          'enhancedThemeMode',
          enhancedThemeMode,
        ),
      );
  }
}

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    required super.child,
    required this.mode,
    required this.light,
    required this.dark,
    required this.themingKey,
    super.key,
  });

  final GlobalThemeKey themingKey;

  final ThemeMode mode;
  final AppTheme light;
  final AppTheme dark;

  static ThemeProvider? maybeOf(final BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>();

  static ThemeProvider of(final BuildContext context) {
    final ThemeProvider? result = maybeOf(context);
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  EnhancedThemeMode get enhancedThemeMode =>
      themingKey.currentState!.enhancedThemeMode;

  set enhancedThemeMode(final EnhancedThemeMode mode) =>
      themingKey.currentState?.enhancedThemeMode = mode;

  void changeTheme({final AppTheme? theme, final EnhancedThemeMode? mode}) =>
      themingKey.currentState?.changeTheme(theme: theme, mode: mode);

  void switchTheme() => themingKey.currentState?.switchTheme();

  @override
  bool updateShouldNotify(final ThemeProvider oldWidget) =>
      mode != oldWidget.mode ||
      light != oldWidget.light ||
      dark != oldWidget.dark;

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppTheme>('dark', dark))
      ..add(DiagnosticsProperty<AppTheme>('light', light))
      ..add(EnumProperty<ThemeMode>('mode', mode))
      ..add(DiagnosticsProperty<GlobalThemeKey>('themingKey', themingKey))
      ..add(
        EnumProperty<EnhancedThemeMode>('enhancedThemeMode', enhancedThemeMode),
      );
  }
}

class GlobalThemeKey extends GlobalKey<_ThemingState> {
  const GlobalThemeKey() : super.constructor();
}
