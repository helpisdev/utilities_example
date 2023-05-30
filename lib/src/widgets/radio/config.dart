import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:just_audio_mpv/just_audio_mpv.dart';
import 'package:universal_io/io.dart' as io;
import 'package:uuid/uuid.dart';

import '../../configuration.dart';
import '../../gen/assets/assets.gen.dart';
import 'widgets/track_player.dart';

class PlayerConfig {
  const PlayerConfig();

  static GlobalKey<TrackPlayerState> playerKey = GlobalKey<TrackPlayerState>();

  // ignore: constant_identifier_names
  static const String ANDROID_AUDIO_CHANNEL =
      'dev.helpis.utilities_example.channel.audio';

  static Future<void> configureAudio() => JustAudioBackground.init(
        androidNotificationChannelId: ANDROID_AUDIO_CHANNEL,
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
        preloadArtwork: true,
        androidShowNotificationBadge: true,
      );

  static void configureMPV() {
    final io.ProcessResult mpv = io.Process.runSync('which', <String>['mpv']);
    final bool isMPVInstalled = mpv.exitCode == 0;
    if (isMPVInstalled) {
      mpvLog = (
        final dynamic message, {
        final dynamic error,
        final JAMPV_LogLevel level = JAMPV_LogLevel.verbose,
        final StackTrace? stackTrace,
      }) async =>
          switch (level) {
            JAMPV_LogLevel.none => null,
            JAMPV_LogLevel.error => logger.e(message, error, stackTrace),
            JAMPV_LogLevel.warning => logger.w(message, error, stackTrace),
            JAMPV_LogLevel.info => logger.i(message, error, stackTrace),
            JAMPV_LogLevel.verbose => logger.v(message, error, stackTrace),
            JAMPV_LogLevel.debug => logger.d(message, error, stackTrace),
          };
    } else {
      logger.e(
        'mpv must be installed on Linux for the radio player '
        'to function properly. Please run:\n'
        'sudo apt update\n'
        'sudo apt install -y mpv',
      );
    }
  }

  static final TrackData track1 = TrackData(
    id: const Uuid(),
    uri: Uri.parse(
      'https://stream.gal.io/arrow?1579873649949',
    ),
    imageDataPath: base64ImageData.stream1Base64Data,
  );

  static final TrackData track2 = TrackData(
    id: const Uuid(),
    uri: Uri.parse(
      'https://25703.live.streamtheworld.com/BNR_NIEUWSRADIO.mp3?dist=other',
    ),
    imageDataPath: base64ImageData.stream2Base64Data,
  );

  static final TrackData track3 = TrackData(
    id: const Uuid(),
    uri: Uri.parse(
      'https://icecast-qmusicnl-cdp.triple-it.nl/Joe_nl_high.aac?aw_0_1st.playerId=redirect',
    ),
    imageDataPath: base64ImageData.stream3Base64Data,
  );

  static final $AssetsImageDataGen base64ImageData = Assets.image.data;
}

class TrackData {
  const TrackData({
    required final Uuid id,
    required this.uri,
    required this.imageDataPath,
  }) : _id = id;

  final Uuid _id;
  final Uri uri;
  final String imageDataPath;

  String get id => _id.v4();

  Future<String> _readImageData(final String path) async {
    final String contents = (await rootBundle.loadString(path))
        .trim()
        .replaceAll(RegExp(r'\s+'), '');
    return contents;
  }

  Future<String> get art => _readImageData(imageDataPath);
}
