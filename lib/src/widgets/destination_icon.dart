import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DestinationIcon extends StatelessWidget {
  const DestinationIcon({required this.iconData, super.key});

  final IconData iconData;

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Icon(iconData, size: 24),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<IconData>('iconData', iconData));
  }
}
