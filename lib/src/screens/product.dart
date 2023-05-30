import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../configuration.dart';
import '../gen/l10n/l10n.dart';

class ProductScreen extends StatelessScreenWidget {
  const ProductScreen({
    required this.state,
    required this.id,
    super.key,
  });

  final int id;

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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Display1(
                    context.l10n.productPageForId(id),
                    maxLines: 5,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('id', id));
  }
}
