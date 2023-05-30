import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_el.dart' deferred as app_localizations_el;
import 'app_localizations_en.dart' deferred as app_localizations_en;

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('el')
  ];

  /// No description provided for @animateTheSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Animate the Snackbar!'**
  String get animateTheSnackbar;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'utilities_example'**
  String get appName;

  /// No description provided for @awesome.
  ///
  /// In en, this message translates to:
  /// **'Awesome!'**
  String get awesome;

  /// No description provided for @changeLocale.
  ///
  /// In en, this message translates to:
  /// **'Current locale is {locale}'**
  String changeLocale(String locale);

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @pausePlayback.
  ///
  /// In en, this message translates to:
  /// **'Pause the current radio station playback.'**
  String get pausePlayback;

  /// No description provided for @playPlayback.
  ///
  /// In en, this message translates to:
  /// **'Listen to the chosen radio station.'**
  String get playPlayback;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price: '**
  String get price;

  /// No description provided for @product10Description.
  ///
  /// In en, this message translates to:
  /// **'Tart, sweet plums perfect for snacking or baking.'**
  String get product10Description;

  /// No description provided for @product10Title.
  ///
  /// In en, this message translates to:
  /// **'Plums'**
  String get product10Title;

  /// No description provided for @product1Description.
  ///
  /// In en, this message translates to:
  /// **'Fresh apples, sold by the pound.'**
  String get product1Description;

  /// No description provided for @product1Title.
  ///
  /// In en, this message translates to:
  /// **'Apples'**
  String get product1Title;

  /// No description provided for @product2Description.
  ///
  /// In en, this message translates to:
  /// **'Ripe bananas, perfect for smoothies or snacks.'**
  String get product2Description;

  /// No description provided for @product2Title.
  ///
  /// In en, this message translates to:
  /// **'Bananas'**
  String get product2Title;

  /// No description provided for @product3Description.
  ///
  /// In en, this message translates to:
  /// **'Sweet, juicy strawberries. Grown locally.'**
  String get product3Description;

  /// No description provided for @product3Title.
  ///
  /// In en, this message translates to:
  /// **'Strawberries'**
  String get product3Title;

  /// No description provided for @product4Description.
  ///
  /// In en, this message translates to:
  /// **'Imported mangos, ready to eat or used in recipes.'**
  String get product4Description;

  /// No description provided for @product4Title.
  ///
  /// In en, this message translates to:
  /// **'Mangos'**
  String get product4Title;

  /// No description provided for @product5Description.
  ///
  /// In en, this message translates to:
  /// **'Plump, delicious blueberries. High in antioxidants.'**
  String get product5Description;

  /// No description provided for @product5Title.
  ///
  /// In en, this message translates to:
  /// **'Blueberries'**
  String get product5Title;

  /// No description provided for @product6Description.
  ///
  /// In en, this message translates to:
  /// **'Fresh raspberries. Perfect for desserts or yogurt.'**
  String get product6Description;

  /// No description provided for @product6Title.
  ///
  /// In en, this message translates to:
  /// **'Raspberries'**
  String get product6Title;

  /// No description provided for @product7Description.
  ///
  /// In en, this message translates to:
  /// **'Blackberries freshly picked. Limited seasonal availability.'**
  String get product7Description;

  /// No description provided for @product7Title.
  ///
  /// In en, this message translates to:
  /// **'Blackberries'**
  String get product7Title;

  /// No description provided for @product8Description.
  ///
  /// In en, this message translates to:
  /// **'Sweet Bing cherries. Only available for a short time each summer.'**
  String get product8Description;

  /// No description provided for @product8Title.
  ///
  /// In en, this message translates to:
  /// **'Cherries'**
  String get product8Title;

  /// No description provided for @product9Description.
  ///
  /// In en, this message translates to:
  /// **'Tree-ripened peaches. Juicy, sweet, and fuzzy.'**
  String get product9Description;

  /// No description provided for @product9Title.
  ///
  /// In en, this message translates to:
  /// **'Peaches'**
  String get product9Title;

  /// No description provided for @productPageForId.
  ///
  /// In en, this message translates to:
  /// **'Product page for: {id}'**
  String productPageForId(int id);

  /// No description provided for @routeOpeningTitle.
  ///
  /// In en, this message translates to:
  /// **'Utilities Example'**
  String get routeOpeningTitle;

  /// No description provided for @routeProductsListTitle.
  ///
  /// In en, this message translates to:
  /// **'Products Catalog'**
  String get routeProductsListTitle;

  /// No description provided for @routeProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Product {id}'**
  String routeProductTitle(int id);

  /// No description provided for @routeSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get routeSettingsTitle;

  /// No description provided for @skipToNext.
  ///
  /// In en, this message translates to:
  /// **'Skip to next radio station.'**
  String get skipToNext;

  /// No description provided for @skipToPrevious.
  ///
  /// In en, this message translates to:
  /// **'Skip to previous radio station.'**
  String get skipToPrevious;

  /// No description provided for @sku.
  ///
  /// In en, this message translates to:
  /// **'SKU: {id}'**
  String sku(int id);

  /// No description provided for @snackbarMessage.
  ///
  /// In en, this message translates to:
  /// **'Now use the drawer to discover more cool features.'**
  String get snackbarMessage;

  /// No description provided for @stream1Title.
  ///
  /// In en, this message translates to:
  /// **'Awesome Stream'**
  String get stream1Title;

  /// No description provided for @stream2Title.
  ///
  /// In en, this message translates to:
  /// **'Talking Show'**
  String get stream2Title;

  /// No description provided for @stream3Title.
  ///
  /// In en, this message translates to:
  /// **'Joe\'s \'70\'s & \'80\'s'**
  String get stream3Title;

  /// No description provided for @switchTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch to {mode} Theme'**
  String switchTheme(String mode);

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the Utilities package Demo!'**
  String get welcome;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>['el', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'el': return app_localizations_el.loadLibrary().then((dynamic _) => app_localizations_el.AppLocalizationsEl());
    case 'en': return app_localizations_en.loadLibrary().then((dynamic _) => app_localizations_en.AppLocalizationsEn());
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
