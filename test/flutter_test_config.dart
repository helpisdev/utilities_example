import 'dart:async';

import 'package:alchemist/alchemist.dart';
// import 'package:custom_styling_package/custom_styling_package.dart';

Future<void> testExecutable(final FutureOr<void> Function() testMain) async {
  // ignore: do_not_use_environment
  const bool isRunningInCi = bool.fromEnvironment('CI');

  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      // theme: CustomTheme.light(),
      platformGoldensConfig: PlatformGoldensConfig(
        enabled: !isRunningInCi,
      ),
    ),
    run: testMain,
  );
}
