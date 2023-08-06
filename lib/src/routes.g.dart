// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: always_specify_types, public_member_api_docs, package:bdd_widget_test/step/i_see_text.dart, package:bdd_widget_test/step/i_dont_see_text.dart, package:bdd_widget_test/step/i_see_multiple_texts.dart, package:bdd_widget_test/step/i_tap_text.dart, package:bdd_widget_test/step/i_see_icon.dart, package:bdd_widget_test/step/i_dont_see_icon.dart, package:bdd_widget_test/step/i_tap_icon.dart, package:bdd_widget_test/step/i_see_rich_text.dart, package:bdd_widget_test/step/i_dont_see_rich_text.dart, package:bdd_widget_test/step/i_see_widget.dart, package:bdd_widget_test/step/i_dont_see_widget.dart, package:bdd_widget_test/step/i_see_exactly_widgets.dart, package:bdd_widget_test/step/i_see_multiple_widgets.dart, package:bdd_widget_test/step/i_enter_into_input_field.dart, package:bdd_widget_test/step/i_see_disabled_elevated_button.dart, package:bdd_widget_test/step/i_see_enabled_elevated_button.dart, package:bdd_widget_test/step/i_wait.dart, package:bdd_widget_test/step/i_dismiss_the_page.dart

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $openingRoute,
    ];

RouteBase get $openingRoute => GoRouteData.$route(
      path: '/',
      factory: $OpeningRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'products',
          factory: $ProductListRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'product/:id',
              factory: $ProductRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'settings',
          factory: $SettingsRouteExtension._fromState,
        ),
      ],
    );

extension $OpeningRouteExtension on OpeningRoute {
  static OpeningRoute _fromState(GoRouterState state) => const OpeningRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductListRouteExtension on ProductListRoute {
  static ProductListRoute _fromState(GoRouterState state) =>
      const ProductListRoute();

  String get location => GoRouteData.$location(
        '/products',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductRouteExtension on ProductRoute {
  static ProductRoute _fromState(GoRouterState state) => ProductRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/products/product/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
