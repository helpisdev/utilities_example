import 'app_localizations.dart';

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get animateTheSnackbar => 'Κινήστε το Snackbar!';

  @override
  String get appName => 'utilities_example';

  @override
  String get awesome => 'Καταπληκτικά!';

  @override
  String changeLocale(String locale) {
    return 'Η τρέχουσα ρύθμιση γλώσσας είναι $locale';
  }

  @override
  String get darkTheme => 'Σκοτεινό';

  @override
  String get gotIt => 'Κατάλαβα';

  @override
  String get lightTheme => 'Φωτεινό';

  @override
  String get pausePlayback => 'Παύση της τρέχουσας αναπαραγωγής ραδιοφωνικού σταθμού.';

  @override
  String get playPlayback => 'Ακρόαση του επιλεγμένου ραδιοφωνικού σταθμού.';

  @override
  String get price => 'Τιμή: ';

  @override
  String get product10Description => 'Τραγανά, γλυκά δαμάσκηνα τέλεια για σνακ ή μαγείρεμα.';

  @override
  String get product10Title => 'Δαμάσκηνα';

  @override
  String get product1Description => 'Φρέσκα μήλα, πωλούνται ανά κιλό.';

  @override
  String get product1Title => 'Μήλα';

  @override
  String get product2Description => 'Ώριμες μπανάνες, τέλειες για smoothies ή σνακ.';

  @override
  String get product2Title => 'Μπανάνες';

  @override
  String get product3Description => 'Γλυκές, χυμώδεις φράουλες. Καλλιεργημένες τοπικά.';

  @override
  String get product3Title => 'Φράουλες';

  @override
  String get product4Description => 'Εισαγόμενες μάγγες, έτοιμες να φαγωθούν ή να χρησιμοποιηθούν σε συνταγές.';

  @override
  String get product4Title => 'Μάγγες';

  @override
  String get product5Description => 'Πλούσια, νόστιμα μύρτιλα. Πλούσια σε αντιοξειδωτικά.';

  @override
  String get product5Title => 'Μύρτιλα';

  @override
  String get product6Description => 'Φρέσκα μαλίνα. Τέλεια για επιδόρπια ή γιαούρτι.';

  @override
  String get product6Title => 'Μαλίνα';

  @override
  String get product7Description => 'Βατόμουρα φρεσκομαζεμένα. Περιορισμένη εποχική διαθεσιμότητα.';

  @override
  String get product7Title => 'Βατόμουρα';

  @override
  String get product8Description => 'Γλυκά κεράσια Bing. Διαθέσιμα μόνο για λίγο κάθε καλοκαίρι.';

  @override
  String get product8Title => 'Κεράσια';

  @override
  String get product9Description => 'Ωριμασμένα στο δέντρο ροδάκινα. Χυμώδεις, γλυκές και αφράτες.';

  @override
  String get product9Title => 'Ροδάκινα';

  @override
  String productPageForId(int id) {
    return 'Σελίδα προϊόντος για: $id';
  }

  @override
  String get routeOpeningTitle => 'Παράδειγμα Utilities';

  @override
  String get routeProductsListTitle => 'Κατάλογος Προϊόντων';

  @override
  String routeProductTitle(int id) {
    return 'Προϊόν $id';
  }

  @override
  String get routeSettingsTitle => 'Ρυθμίσεις';

  @override
  String get skipToNext => 'Προχωρήστε στον επόμενο ραδιοφωνικό σταθμό.';

  @override
  String get skipToPrevious => 'Προχωρήστε στον προηγούμενο ραδιοφωνικό σταθμό.';

  @override
  String sku(int id) {
    return 'SKU: $id';
  }

  @override
  String get snackbarMessage => 'Τώρα χρησιμοποιήστε το συρτάρι για να ανακαλύψετε περισσότερες κουλ λειτουργίες.';

  @override
  String get stream1Title => 'Καταπληκτικό Ρεύμα';

  @override
  String get stream2Title => 'Εκπομπή Συζήτησης';

  @override
  String get stream3Title => '70\'s & 80\'s του Joe';

  @override
  String switchTheme(String mode) {
    return 'Εναλλαγή σε $mode Θέμα';
  }

  @override
  String get welcome => 'Καλώς ήρθατε στην επίδειξη του πακέτου Utilities!';
}
