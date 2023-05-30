import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../gen/l10n/l10n.dart';

class UtilitiesSnackBar extends StatelessWidget {
  const UtilitiesSnackBar({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => StyledOutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.face, size: 48),
        label: LabelExtraLarge(
          context.l10n.animateTheSnackbar,
          style: LabelExtraLarge.defaultStyle.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed),
    );
  }
}
