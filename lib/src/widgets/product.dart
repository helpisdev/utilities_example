import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../gen/l10n/l10n.dart';
import '../gen/theme/colors.helpis.dart';
import '../routes.dart';

class Product extends StatelessWidget {
  const Product({
    required this.title,
    required this.message,
    required this.id,
    required this.price,
    required this.cur,
    super.key,
  });

  final String title;
  final String message;
  final int id;
  final double price;
  final Currency cur;

  @override
  Widget build(final BuildContext context) => Card(
        elevation: 2,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => ProductRoute(id: id).go(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (!Platform.isMobile) ...<Widget>[
                  Flexible(
                    flex: 4,
                    child: ProductDisplay(cur: cur, price: price),
                  ),
                  const Spacer()
                ],
                Flexible(
                  flex: 6,
                  child: ProductInfo(
                    title: title,
                    id: id,
                    message: message,
                    cur: cur,
                    price: price,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<Currency>('cur', cur))
      ..add(StringProperty('title', title))
      ..add(StringProperty('message', message))
      ..add(IntProperty('id', id))
      ..add(DoubleProperty('price', price));
  }
}

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    required this.cur,
    required this.price,
    super.key,
  });

  final Currency cur;
  final double price;

  @override
  Widget build(final BuildContext context) => Container(
        height: Platform.isMobile ? 50 : 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.currentTheme.secondaryContainer,
          border: Border(
            right: BorderSide(
              color: context.currentTheme.onSecondaryContainer,
              width: Platform.isMobile ? 0 : 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (!Platform.isMobile)
              Flexible(
                flex: 2,
                child: Center(
                  child: Placeholder(
                    color: context.currentTheme.onSecondaryContainer,
                    child: const SizedBox.square(dimension: 300),
                  ),
                ),
              ),
            Flexible(
              child: ProductPrice(cur: cur, price: price),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<Currency>('cur', cur))
      ..add(DoubleProperty('price', price));
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    required this.cur,
    required this.price,
    super.key,
  });

  final Currency cur;
  final double price;

  @override
  Widget build(final BuildContext context) {
    final ResizableText formattedPrice = Platform.isMobile
        ? H4(
            cur.format(price),
            style: H4.defaultStyle.copyWith(
              fontWeight: FontWeight.w300,
              color: context.currentTheme.onSecondaryContainer,
            ),
          )
        : H3(
            cur.format(price),
            style: H3.defaultStyle.copyWith(
              fontWeight: FontWeight.w300,
              color: context.currentTheme.onSecondaryContainer,
            ),
          );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        H5(
          context.l10n.price,
          style: H5.defaultStyle.copyWith(
            fontWeight: FontWeight.w300,
            color: context.currentTheme.onSecondaryContainer,
          ),
        ),
        formattedPrice,
      ],
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<Currency>('cur', cur))
      ..add(DoubleProperty('price', price));
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    required this.title,
    required this.id,
    required this.message,
    required this.cur,
    required this.price,
    super.key,
  });

  final Currency cur;
  final double price;
  final String title;
  final int id;
  final String message;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 15,
              left: 15,
            ),
            child: ProductTitle(title: title, id: id),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              right: 15,
              left: 15,
            ),
            child: LeadParagraph(
              message,
              maxLines: 10,
              style: Platform.isMobile
                  ? LeadParagraph.defaultStyle.copyWith(
                      height: 1.1,
                      minFont: 14,
                      maxFont: 18,
                    )
                  : LeadParagraph.defaultStyle.copyWith(
                      height: 1.3,
                      minFont: 20,
                      maxFont: 32,
                    ),
            ),
          ),
          if (Platform.isMobile) ...<Widget>[
            ProductDisplay(cur: cur, price: price)
          ],
        ],
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(IntProperty('id', id))
      ..add(StringProperty('message', message))
      ..add(EnumProperty<Currency>('cur', cur))
      ..add(DoubleProperty('price', price));
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    required this.title,
    required this.id,
    super.key,
  });

  final String title;
  final int id;

  @override
  Widget build(final BuildContext context) => Visibility(
        visible: Platform.isDesktop,
        replacement: H3(
          title,
          style: H3.defaultStyle.copyWith(fontStyle: FontStyle.italic),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Flexible(
              child: H2(
                title,
                style: H2.defaultStyle.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: LabelSmall(context.l10n.sku(id)),
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(IntProperty('id', id));
  }
}
