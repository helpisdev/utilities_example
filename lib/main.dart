import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:utilities/utilities.dart' as util;

import 'src/entry.dart';
import 'src/service/cache/storage_service.helpis.dart';
import 'src/widgets/radio/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  if (util.Platform.isDesktop) {
    await GTKManager.ensureInitialized();
  }

  if (util.Platform.isWeb) {
    util.usePathUrlStrategy();
  }

  util.ensureInitialized();

  final util.PermissionHandler permissions = util.PermissionHandler(
    permissions: <Permission>{
      Permission.audio,
      Permission.bluetooth,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.mediaLibrary,
      Permission.notification,
      Permission.storage,
    },
  );

  await permissions.request();

  if (!util.Platform.isWeb) {
    await PlayerConfig.configureAudio();
  }
  if (util.Platform.isLinux && !util.Platform.isWeb) {
    PlayerConfig.configureMPV();
  }

  await storage.init();

  runApp(const App());
}
