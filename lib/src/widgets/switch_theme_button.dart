import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../gen/l10n/l10n.dart';
import '../gen/theme/colors.helpis.dart';
import '../service/cache/storage_service.helpis.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({
    required this.iconStyle,
    super.key,
  });

  final ButtonStyle iconStyle;

  @override
  Widget build(final BuildContext context) {
    final String themeMode =
        context.isLightMode ? context.l10n.darkTheme : context.l10n.lightTheme;
    return IconButton(
      onPressed: () async {
        final ThemeProvider themeProvider = ThemeProvider.of(context)
          ..switchTheme();
        await storage.write(
          StorageKey.isDarkMode.name,
          themeProvider.enhancedThemeMode == EnhancedThemeMode.dark,
        );
      },
      style: iconStyle,
      tooltip: context.l10n.switchTheme(themeMode),
      icon: Icon(
        context.isLightMode
            ? Icons.dark_mode_rounded
            : Icons.light_mode_rounded,
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ButtonStyle>('iconStyle', iconStyle));
  }
}
