import 'dart:math';

import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../configuration.dart';
import '../gen/l10n/l10n.dart';
import '../widgets/product.dart';

class ProductListScreen extends StatelessScreenWidget {
  const ProductListScreen({
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
                child: FutureBuilder<List<Product>>(
                  future: Future<List<Product>>.delayed(
                    const Duration(seconds: 3),
                    () => <Product>[
                      Product(
                        title: context.l10n.product1Title,
                        message: context.l10n.product1Description,
                        id: 1,
                        price: 1.20,
                        cur: Currency.USD,
                      ),
                      Product(
                        title: context.l10n.product2Title,
                        message: context.l10n.product2Description,
                        id: 2,
                        price: 0.89,
                        cur: Currency.EUR,
                      ),
                      Product(
                        title: context.l10n.product3Title,
                        message: context.l10n.product3Description,
                        id: 3,
                        price: 3.50,
                        cur: Currency.CAD,
                      ),
                      Product(
                        title: context.l10n.product4Title,
                        message: context.l10n.product4Description,
                        id: 4,
                        price: 2.25,
                        cur: Currency.AUD,
                      ),
                      Product(
                        title: context.l10n.product5Title,
                        message: context.l10n.product5Description,
                        id: 5,
                        price: 4.99,
                        cur: Currency.GBP,
                      ),
                      Product(
                        title: context.l10n.product6Title,
                        message: context.l10n.product6Description,
                        id: 6,
                        price: 5.50,
                        cur: Currency.RUB,
                      ),
                      Product(
                        title: context.l10n.product7Title,
                        message: context.l10n.product7Description,
                        id: 7,
                        price: 6.25,
                        cur: Currency.LKR,
                      ),
                      Product(
                        title: context.l10n.product8Title,
                        message: context.l10n.product8Description,
                        id: 8,
                        price: 8.99,
                        cur: Currency.USD,
                      ),
                      Product(
                        title: context.l10n.product9Title,
                        message: context.l10n.product9Description,
                        id: 9,
                        price: 1.75,
                        cur: Currency.USD,
                      ),
                      Product(
                        title: context.l10n.product10Title,
                        message: context.l10n.product10Description,
                        id: 10,
                        price: 2.50,
                        cur: Currency.USD,
                      )
                    ],
                  ),
                  builder: (
                    final BuildContext context,
                    final AsyncSnapshot<List<Product>> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        width: min(
                          1080,
                          context.widthTransformer(percentage: 90),
                        ),
                        child: const LoadingShimmer(),
                      );
                    } else {
                      final List<Product>? children = snapshot.data;
                      return FadingListView(
                        breakpoints: const <double>[0, 0.75, 1],
                        list: ListView.separated(
                          padding: EdgeInsets.only(
                            top: 25,
                            bottom: 150,
                            left: Platform.isMobile ? 10 : 50,
                            right: Platform.isMobile ? 10 : 50,
                          ),
                          itemCount: children!.length,
                          itemBuilder: (
                            final BuildContext context,
                            final int index,
                          ) =>
                              children.elementAt(index),
                          separatorBuilder: (
                            final BuildContext context,
                            final int index,
                          ) =>
                              Divider(
                            thickness: 2,
                            height: Platform.isMobile ? 50 : 100,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      );
}
