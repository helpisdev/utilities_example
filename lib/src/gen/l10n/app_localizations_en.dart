import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get animateTheSnackbar => 'Animate the Snackbar!';

  @override
  String get appName => 'utilities_example';

  @override
  String get awesome => 'Awesome!';

  @override
  String changeLocale(String locale) {
    return 'Current locale is $locale';
  }

  @override
  String get darkTheme => 'Dark';

  @override
  String get gotIt => 'Got it';

  @override
  String get lightTheme => 'Light';

  @override
  String get pausePlayback => 'Pause the current radio station playback.';

  @override
  String get playPlayback => 'Listen to the chosen radio station.';

  @override
  String get price => 'Price: ';

  @override
  String get product10Description => 'Tart, sweet plums perfect for snacking or baking.';

  @override
  String get product10Title => 'Plums';

  @override
  String get product1Description => 'Fresh apples, sold by the pound.';

  @override
  String get product1Title => 'Apples';

  @override
  String get product2Description => 'Ripe bananas, perfect for smoothies or snacks.';

  @override
  String get product2Title => 'Bananas';

  @override
  String get product3Description => 'Sweet, juicy strawberries. Grown locally.';

  @override
  String get product3Title => 'Strawberries';

  @override
  String get product4Description => 'Imported mangos, ready to eat or used in recipes.';

  @override
  String get product4Title => 'Mangos';

  @override
  String get product5Description => 'Plump, delicious blueberries. High in antioxidants.';

  @override
  String get product5Title => 'Blueberries';

  @override
  String get product6Description => 'Fresh raspberries. Perfect for desserts or yogurt.';

  @override
  String get product6Title => 'Raspberries';

  @override
  String get product7Description => 'Blackberries freshly picked. Limited seasonal availability.';

  @override
  String get product7Title => 'Blackberries';

  @override
  String get product8Description => 'Sweet Bing cherries. Only available for a short time each summer.';

  @override
  String get product8Title => 'Cherries';

  @override
  String get product9Description => 'Tree-ripened peaches. Juicy, sweet, and fuzzy.';

  @override
  String get product9Title => 'Peaches';

  @override
  String productPageForId(int id) {
    return 'Product page for: $id';
  }

  @override
  String get routeOpeningTitle => 'Utilities Example';

  @override
  String get routeProductsListTitle => 'Products Catalog';

  @override
  String routeProductTitle(int id) {
    return 'Product $id';
  }

  @override
  String get routeSettingsTitle => 'Settings';

  @override
  String get skipToNext => 'Skip to next radio station.';

  @override
  String get skipToPrevious => 'Skip to previous radio station.';

  @override
  String sku(int id) {
    return 'SKU: $id';
  }

  @override
  String get snackbarMessage => 'Now use the drawer to discover more cool features.';

  @override
  String get stream1Title => 'Awesome Stream';

  @override
  String get stream2Title => 'Talking Show';

  @override
  String get stream3Title => 'Joe\'s \'70\'s & \'80\'s';

  @override
  String switchTheme(String mode) {
    return 'Switch to $mode Theme';
  }

  @override
  String get welcome => 'Welcome to the Utilities package Demo!';
}
