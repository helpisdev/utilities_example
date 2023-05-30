# Utilities

> `utilities_example` was auto-generated by `helpis_cli`

## About The Project

--------------------

The aim of this project is to provide a range of examples for the functionality provided in the [utilities](https://github.com/helpisdev/utilities.git) package, the [adaptive_scaffold](https://github.com/helpisdev/scaffold.git), and the [helpis_cli](https://github.com/helpisdev/helpis_cli.git).

### ___Built With:___

[![Dart][Dart]][dart-url] [![Flutter][Flutter]][flutter-url]

## Getting Started

--------------------

The example has been developed and tested on `PopOS 22.04`, on a physical `android` device, and on the latest `google-chrome-stable` from the `apt` package repository on `linux`.

Known issues:

- The `just_audio` implementation for linux based on `mpv` has many bugs and malfunctions.
- There is no way to my knowledge to change the localization of `MediaItem`s that display song information on the android system (lock screen & notifications bar)

### Prerequisites

To install and build the project you have to have already installed __git__, and __flutter__.
You can find instructions on how to install those on their respected websites:

- [git](https://git-scm.com/downloads)
- [flutter](https://docs.flutter.dev/get-started/install)

### Installation

1. Clone the repo

   ```bash
   git clone https://github.com/helpisdev/utilities_example.git
   ```

2. Change directory to `utilities_example`

   ```bash
   cd utilities_example
   ```

3. Install Flutter packages

   ```bash
   flutter pub get
   ```

4. If you are on `linux`, download `mpv`:

   ```bash
   sudo apt update
   sudo apt install -y mpv
   ```

5. Symlink the [gradle.properties](gradle.properties) inside the `android` directory to run on android. For example, on `linux` run:

   ```bash
   cd android
   ln -s ../gradle.properties .
   cd ..
   ```

6. Run the project:

   ```bash
   flutter run --flavor production
   ```

> To build release instances or for other platforms check [BUILD.md](BUILD.md)

## Usages

### The `lib/main.dart` file is using the following features from `utilities`, `adaptive_scaffold`, and `helpis_cli`

#### From `utilities`

- `util.Platform` to check the platform (web, desktop, mobile)
- `util.usePathUrlStrategy()` to use path URLs on the web
- `util.ensureInitialized()` to initialize utilities dependencies
- `util.PermissionHandler` to request permissions

#### From `adaptive_scaffold

- `AdaptiveScaffold` which provides a responsive layout for web, desktop and mobile
- `GTKManager` to initialize GTK on desktop

#### From `helpis_cli`

- Initializes the caching service generated with `helpis createStore`

### In `lib/src/configuration.dart`, the following features of `utilities` and `adaptive_scaffold` are being used

#### `adaptive_scaffold`

- `GoRouterAdaptiveScaffoldConfig` to configure the adaptive scaffold.
- `AdaptiveAppBar`, `AdaptiveScrollbarConfig` and `NavigationRailConfig` to configure the app bar, scrollbar and navigation rail respectively.

#### `utilities`

- `H4` from `utilities` to style the app bar title.
- `context.currentTheme` to get the current theme.

### In `lib/src/entry.dart`, the following features of `utilities`, `helpis_cli`, and `adaptive_scaffold` are being used

#### `utilities`

- `util.Localizations` is used to provide locale-specific resources to the app.
- `util.WebDragScrollBehavior()` is used as the scroll behavior for the `MaterialApp`. It enables drag-to-scroll behavior for web.
- `util.ScreenSizeProvider` is a widget used to provide the screen size to its child widget.
- The `ChangeLocalization` extension is used to change the locale of a `BuildContext`. It is called as `context.changeLocale(locale)`.

#### From `helpis_cli`, from commands `colorgen`, `createStore`, and `create`

- `storage` refers to the `StorageService` which is used to cache data in the app. It is used to store the locale, theme mode, and other settings.
- `Theming` is a widget used to provide theme data to its child widget. It uses the `ThemeProvider` to get the current theme.
- `ThemeProvider` is used to manage the light and dark themes, and switch between them. It is accessed using `ThemeProvider.of(context)`.

#### `adaptive_scaffold`

- `GTKLocalizations.delegate` is used to provide GTK-based localizations to the app.

### The `lib/src/gen/l10n/l10n.dart` file is using the following features from `utilities`

- The `LocaleName` `typedef` to represent a locale nameas a `String`.
- The `LocalizationsProvider` to provide locale information to the `BuildContext`.
- The `Language` enum is used to represent the supported languages in the app. It currently has two options:
  - `EN` for English
  - `EL` for Greek
The `language` getter uses the `LocalizationsProvider` to get the currently selected `Language` based on the locale.

### The `lib/src/routes.dart` file is using the following features from `utilities`

- The `ScreenRoute` class is used as a base class for all app routes in `lib/src/routes.dart`. It defines some common properties and methods for the routes:
  - `title()`: Returns the title for the route.
  - `builder`: Returns the widget builder for the route.

The actual app routes (like `OpeningRoute`, `SettingsRoute`, etc.) extend the `AppRoute` which extends `ScreenRoute` class and provide implementations for the `title()`, `builder` and extra methods defined in `AppRoute` like `navigate<T>()` methods.

So in summary, the `ScreenRoute` class defines a common interface/contract for all app routes, and the concrete route classes implement that interface.

### The `lib/src/screens/opening.dart` file is using the following features from `utilities` and `adaptive_scaffold`

#### From `utilities`

- `snackBar()` which is used to show a `SnackBar` with an action button.
- `Breakpoint` and `PredefinedBreakpoint` which are used to determine if the screen is being shown on mobile or desktop.
- `Platform` which is used to check if the platform is mobile or desktop.

#### From `adaptive_scaffold`

- `GoRouterAdaptiveScaffoldConfig` which is used to configure the `AdaptiveScaffold`.
- `GoRouterBodyConfig` which is used to configure the body of the `AdaptiveScaffold`.
- `StatelessScreen` which is the base screen class used. Extends `Screen`.
- `AdaptiveScaffold` which is the main scaffold widget used to handle responsiveness.

The `OpeningScreen` is using these widgets and utilities to show either a desktop layout with a radio player above the scaffold, or a mobile layout with the radio player below the scaffold. It also shows a `SnackBar` with an action button on desktop, and without an action button on mobile. The `OpeningScreen` is also a `StatefulScreenWidget`, a `Screen` without the enforcement of returning a `Screen` from `build`, that can also hold its own state.

### The `lib/src/screens/product_list.dart` file is using the following features from `utilities`

- `LoadingShimmer`, which displays a shimmering loading effect while data is loading. It is used here as a placeholder while the `FutureBuilder` is waiting for the product data (mocked with a 3 second delay).
- `FadingListView`, which is a `ListView` that fades items in and out as they scroll on and off screen. It is used here to display the list of products, fading them in and out smoothly.
- `widthTransformer`, which is a utility function that calculates a width based on a percentage of the available width. It is used here to get 90% of the available width, and pass that to the `LoadingShimmer` as its width.

### The `lib/src/screens/settings.dart` file is using the following features from `utilities` and `helpis_cli`

#### From `utilities`

- `LabelLarge` is used to display the text for the language switch button. It is given a maximum of 3 lines and is center aligned.
- `BuildContext.changeLocale` is called to change the locale/language of the app. It is passed the new `Language` to change to.
- `StyledElevatedButton.icon` is used to create the language switch button. It displays an icon and label, and calls the onPressed method when tapped to change the language.

#### From `helpis_cli`

- `storage.write` is called to save the new locale's language code to cache using the `StorageKey.locale.name` key.

### The `lib/src/screens/product.dart` file is using the following features from `utilities`

- `LeadParagraph`: Used to display the product description. It is a responsive text widget that adapts its font size based on the viewport size.
- `H2`, `H3`, `H4`: Used to display the product title. `H3` is used on mobile, `H2` on desktop. `H4` is used to display the formatted product price on mobile.
- `LabelSmall`: Used to display the product SKU (Stock Keeping Unit) on desktop.
- `ResizableText`: Used to format and display the product price. It is a responsive text widget that adapts its font size based on the viewport size.
- `Platform`: Used to check if the app is running on mobile or desktop and show/hide certain widgets accordingly.
- `BuildContext.currentTheme`: Used to get the current theme and use its colors for text, containers, etc.
- `Currency`: Represents the currency the product is priced in. Used to format the price correctly.
- `Currency.format`: Used to format the product price according to the currency. For example, $1.99 for USD, €1.99 for EUR.

### The `lib/src/widgets/radio/widgets/player_screen_builder.dart` file is using the following features from `utilities` and `adaptive_scaffold`

#### From `utilities`

- `produceValOrNull`: This is a utility function that takes a producer function and an input value. It will call the producer function if the input value is non-null, and return the produced value. Otherwise it returns `null`. It is used here to optionally configure an `AdaptiveScaffoldConfig` if one is passed in.
- `produceT1fromT2orNull`: This is similar to `produceValOrNull` but converts from one type to another. It is used here to optionally convert a `Scaffold` to a `ScreenScaffold` if a `Scaffold` is passed in.
- `ScreenScaffold`: This wraps a `Scaffold` and adds a `GoRouterState`. It is used so that the `Scaffold` can be used within the `GoRouter` navigation system.
- `Copy` interface: This is used to create a copy of the `AdaptiveScrollbarConfig` with some updated values.
- `TransparentPointer`: This is a widget that makes its child transparent to pointer events. It is used here to make the `TrackPlayer` transparent to taps and drags so that when it is invisible, it let's the taps propagate the tree.
- `ScreenWidget.generate`: This is used to generate a `ScreenWidget` with some default configuration. Here it is used to generate the screen widget returned by the builder function with a `ScreenScaffold` and configured `AdaptiveScaffoldConfig`.

#### From `adaptive_scaffold`

- `AdaptiveScrollbarConfig`: This is used to configure scrollbars. Here it is used to connect the `_scrollController` to the scrollbar.

### The `lib/src/widgets/radio/widgets/track_channel.dart` file is using the following features from `utilities`

- The `Base64Image` widget is used to display the channel's image. It loads the image data from a Base64-encoded string and caches the image in the system's `temp` directory.
The `ResizableText` widgets are used to display the channel's title and artist. They resize the text based on the available space.
  - `BodySmall` displays small body text. It is used for the channel title on mobile.
  - `BodyMedium` displays medium-sized body text. It is used for the channel title on desktop, with a max of 2 lines.
  - `LabelExtraSmall` displays extra small label text. It is used for the channel artist on mobile.
  - `LabelNormal` displays normal-sized label text. It is used for the channel artist on desktop, with a max of 2 lines.
These text widgets are used to appropriately size the channel's title and artist for mobile vs desktop, and constrain the text to a maximum of 2 lines on desktop.

<!-- STYLEGUIDES -->
## Styleguide

--------------------

We try to be consistent in code style throughout our codebase and follow certain guidelines. Most of them should comply with popular standards, but some might diverge due to personal preferences and conventions. Please read more about our code style if you are considering to contribute to our products. You find general recommendations at [STYLEGUIDE.md](STYLEGUIDE.md), and language-specific guidelines at the respective styleguides for each language used.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Dart]: https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=dart&logoColor=white
[dart-url]: https://dart.dev/
[Flutter]: https://img.shields.io/badge/flutter-44d1fd?style=for-the-badge&logo=flutter&logoColor=08589c
[flutter-url]: https://flutter.dev/
