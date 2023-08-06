import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import 'gen/l10n/l10n.dart';
import 'screens/opening.dart';
import 'screens/product.dart';
import 'screens/product_list.dart';
import 'screens/settings.dart';

part 'routes.g.dart';

extension AppRouteProvider on BuildContext {
  AppRoute get currentRoute => AppRoute.fromLocation(
        this,
        GoRouterState.of(this).uri.toString(),
      );
}

enum RoutingMethod {
  go,
  push,
  pushReplacement,
  replace,
}

// Would be nice if this was made part of the library but sealed types cannot
// be extended outside of file/library
sealed class AppRoute extends ScreenRoute {
  const AppRoute() : super();

  abstract final int? index;

  bool matchesLocation(final String location);

  Future<T?> navigate<T>(
    final BuildContext context,
    final RoutingMethod method,
  );

  static AppRoute? fromIndex(final int index) {
    if (index == const OpeningRoute().index) {
      return const OpeningRoute();
    } else if (index == const SettingsRoute().index) {
      return const SettingsRoute();
    } else if (index == const ProductListRoute().index) {
      return const ProductListRoute();
    } else {
      return null;
    }
  }

  static AppRoute fromLocation(
    final BuildContext context,
    final String location,
  ) {
    if (const OpeningRoute().matchesLocation(location)) {
      return const OpeningRoute();
    } else if (const SettingsRoute().matchesLocation(location)) {
      return const SettingsRoute();
    } else if (const ProductListRoute().matchesLocation(location)) {
      return const ProductListRoute();
    } else {
      final int? id = int.tryParse(
        GoRouterState.of(context).uri.pathSegments.last,
      );
      if (id == null) {
        return const ProductListRoute();
      }
      return ProductRoute(id: id);
    }
  }
}

@TypedGoRoute<OpeningRoute>(
  path: '/',
  routes: <TypedGoRoute<AppRoute>>[
    TypedGoRoute<ProductListRoute>(
      path: 'products',
      routes: <TypedGoRoute<AppRoute>>[
        TypedGoRoute<ProductRoute>(path: 'product/:id'),
      ],
    ),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
  ],
)
class OpeningRoute extends AppRoute {
  const OpeningRoute() : super();

  @override
  String title(final BuildContext context) => context.l10n.routeOpeningTitle;

  @override
  RouteScreenBuilder get builder => (
        final BuildContext context,
        final GoRouterState state,
      ) =>
          OpeningScreen(state: state);

  @override
  int? get index => 0;

  @override
  bool matchesLocation(final String location) => this.location == location;

  @override
  Future<T?> navigate<T>(
    final BuildContext context,
    final RoutingMethod method,
  ) async {
    switch (method) {
      case RoutingMethod.go:
        go(context);
        break;
      case RoutingMethod.push:
        return push<T>(context);
      case RoutingMethod.pushReplacement:
        pushReplacement(context);
        break;
      case RoutingMethod.replace:
        replace(context);
        break;
    }
    return null;
  }
}

class SettingsRoute extends AppRoute {
  const SettingsRoute() : super();

  @override
  String title(final BuildContext context) => context.l10n.routeSettingsTitle;

  @override
  RouteScreenBuilder get builder => (
        final BuildContext context,
        final GoRouterState state,
      ) =>
          SettingsScreen(state: state);

  @override
  int? get index => 2;

  @override
  bool matchesLocation(final String location) => this.location == location;

  @override
  Future<T?> navigate<T>(
    final BuildContext context,
    final RoutingMethod method,
  ) async {
    switch (method) {
      case RoutingMethod.go:
        go(context);
        break;
      case RoutingMethod.push:
        return push<T>(context);
      case RoutingMethod.pushReplacement:
        pushReplacement(context);
        break;
      case RoutingMethod.replace:
        replace(context);
        break;
    }
    return null;
  }
}

class ProductListRoute extends AppRoute {
  const ProductListRoute() : super();

  @override
  String title(final BuildContext context) =>
      context.l10n.routeProductsListTitle;

  @override
  RouteScreenBuilder get builder => (
        final BuildContext context,
        final GoRouterState state,
      ) =>
          ProductListScreen(state: state);

  @override
  int? get index => 1;

  @override
  bool matchesLocation(final String location) => this.location == location;

  @override
  Future<T?> navigate<T>(
    final BuildContext context,
    final RoutingMethod method,
  ) async {
    switch (method) {
      case RoutingMethod.go:
        go(context);
        break;
      case RoutingMethod.push:
        return push<T>(context);
      case RoutingMethod.pushReplacement:
        pushReplacement(context);
        break;
      case RoutingMethod.replace:
        replace(context);
        break;
    }
    return null;
  }
}

class ProductRoute extends AppRoute {
  const ProductRoute({required this.id}) : super();

  final int id;

  @override
  String title(final BuildContext context) =>
      context.l10n.routeProductTitle(id);

  @override
  RouteScreenBuilder get builder => (
        final BuildContext context,
        final GoRouterState state,
      ) =>
          ProductScreen(state: state, id: id);

  @override
  int? get index => null;

  @override
  bool matchesLocation(final String location) => this.location == location;

  @override
  Future<T?> navigate<T>(
    final BuildContext context,
    final RoutingMethod method,
  ) async {
    switch (method) {
      case RoutingMethod.go:
        go(context);
        break;
      case RoutingMethod.push:
        return push<T>(context);
      case RoutingMethod.pushReplacement:
        pushReplacement(context);
        break;
      case RoutingMethod.replace:
        replace(context);
        break;
    }
    return null;
  }
}
