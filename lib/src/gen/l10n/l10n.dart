import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import 'app_localizations.dart';

extension AppLocalizationsExtension on BuildContext {
  LocaleName get localeName => l10n.localeName;
  Locale get locale => Locale(localeName);
  Language? get language => LocalizationsProvider.maybeOf(this)?.language;
  AppLocalizations get l10n => AppLocalizations.of(this);
}
