import 'dart:core';

import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

import '../player.dart';
import 'player_provider.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({super.key});

  @override
  Widget build(final BuildContext context) {
    final Player player = TrackPlayerProvider.of(context).player;
    final bool isMobile = Platform.isMobile;
    return ValueListenableBuilder<TrackPlayerListenable>(
      valueListenable: player,
      builder: (final _, final TrackPlayerListenable track, final __) {
        final String trackTitle = track.track.title;
        final ResizableText title = isMobile
            ? BodySmall(trackTitle)
            : BodyMedium(trackTitle, maxLines: 2);
        final String? trackArtist = track.track.artist;
        final ResizableText artist = isMobile
            ? LabelExtraSmall(trackArtist)
            : LabelNormal(trackArtist, maxLines: 2);
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(flex: 45, child: title),
            if (trackArtist != null) ...<Widget>[
              const Spacer(flex: 5),
              Flexible(flex: 45, child: artist)
            ],
          ],
        );
      },
    );
  }
}

class ChannelImage extends StatelessWidget {
  const ChannelImage({super.key});

  static const double minImageSize = 75;
  static const double maxImageSize = 125;

  @override
  Widget build(final BuildContext context) {
    final Player player = TrackPlayerProvider.of(context).player;
    return ValueListenableBuilder<TrackPlayerListenable>(
      valueListenable: player,
      builder: (final _, final TrackPlayerListenable track, final __) {
        final Future<String>? data = track.track.artData;
        if (data == null) {
          return const Placeholder();
        }
        return Base64Image(
          source: data,
          constraints: const BoxConstraints(
            maxWidth: maxImageSize,
            maxHeight: maxImageSize,
            minWidth: minImageSize,
            minHeight: minImageSize,
          ),
          edit: (final Widget child) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: child,
          ),
        );
      },
    );
  }
}
