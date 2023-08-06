import 'dart:async';

import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart' as util;

import 'src/configuration.dart';
import 'src/entry.dart';
import 'src/gen/theme/colors.helpis.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (configureGTK) {
    await GTKManager.ensureInitialized(
      options: WindowOptions(
        backgroundColor: AppTheme.rustDarkTheme.themeData.background,
        titleBarStyle: TitleBarStyle.hidden,
      ),
    );
  }

  runApp(
    const Theming(
      child: util.ScreenSizeProvider(
        child: util.Localizations(
          child: App(),
        ),
      ),
    ),
  );
}
