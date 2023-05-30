import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../gen/l10n/l10n.dart';
import 'snackbar.dart';

class Welcome extends StatelessWidget {
  const Welcome({required this.showSnackBar, super.key});

  final void Function(BuildContext context) showSnackBar;

  @override
  Widget build(final BuildContext context) {
    final ResizableText title = Platform.isMobile
        ? Display2(
            context.l10n.welcome,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: Display2.defaultStyle.copyWith(maxFont: 50),
          )
        : Display1(
            context.l10n.welcome,
            textAlign: TextAlign.center,
            maxLines: 3,
          );
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: context.height,
          width: context.width,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 75),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(flex: 20, child: title),
              const Spacer(),
              Flexible(
                flex: 20,
                child: UtilitiesSnackBar(
                  onPressed: () => showSnackBar(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(BuildContext context)>.has(
        'showSnackBar',
        showSnackBar,
      ),
    );
  }
}
