import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../configuration.dart';
import '../gen/l10n/l10n.dart';
import '../service/cache/storage_service.helpis.dart';
import '../widgets/switch_theme_button.dart';

class SettingsScreen extends StatelessScreenWidget {
  const SettingsScreen({
    required this.state,
    super.key,
  });

  @override
  final GoRouterState state;

  @override
  Screen build(final BuildContext context) => StatelessScreen(
        state: state,
        adaptiveScaffoldConfig: configureAdaptiveScaffold(
          context: context,
          bodyConfig: GoRouterBodyConfig(
            body: (
              final BuildContext context, [
              final GoRouterState? state,
            ]) =>
                SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: StyledElevatedButton.icon(
                          onPressed: () async {
                            final Language language =
                                context.language == Language.EL
                                    ? Language.EN
                                    : Language.EL;
                            context.changeLanguage(language);
                            await storage.write(
                              StorageKey.locale.name,
                              language.locale.languageCode,
                            );
                          },
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.translate),
                          ),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LabelLarge(
                              context.l10n.changeLocale(context.localeName),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 2,
                        child: SwitchThemeButton(
                          iconStyle: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            fixedSize: const Size.square(54),
                            iconSize: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
