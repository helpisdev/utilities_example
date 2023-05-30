import 'dart:async';
import 'dart:collection';

import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'player.g.dart';

typedef Playlist = DoubleLinkedQueue<Track>;
typedef PlaylistEntry = DoubleLinkedQueueEntry<Track>;

class Player extends TrackPlayerNotifier {
  Player({required this.playlist})
      : assert(playlist.isNotEmpty, 'Playlist cannot be empty.'),
        super(TrackPlayerListenable(track: playlist.first, isPlaying: false)) {
    _playlistPointer = _first;
    unawaited(_init());
  }

  factory Player.from({
    required final Playlist playlist,
    final Player? player,
  }) {
    if (player == null) {
      return Player(playlist: playlist);
    }
    DoubleLinkedQueueEntry<Track> currentEntry = playlist.firstEntry()!;
    playlist.forEachEntry(
      (final DoubleLinkedQueueEntry<Track> entry) {
        if (entry.element == player.track) {
          currentEntry = entry;
        }
      },
    );
    return player
      ..playlist = playlist
      .._playlistPointer = currentEntry
      ..isPlaying = player.isPlaying
      ..track = playlist.elementAt(player.track.index);
  }

  Future<void> _init() async {
    await player.setAudioSource(
      ConcatenatingAudioSource(
        useLazyPreparation: false,
        children: playlist.map((final Track track) => track.source).toList(),
      ),
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
    await player.setLoopMode(LoopMode.all);
    await player.setShuffleModeEnabled(false);
  }

  Playlist playlist;
  final AudioPlayer player = AudioPlayer();

  late PlaylistEntry _playlistPointer;
  PlaylistEntry get _first => playlist.firstEntry()!;
  PlaylistEntry get _last => playlist.lastEntry()!;
  PlaylistEntry get _next => _playlistPointer.nextEntry() ?? _first;
  PlaylistEntry get _prev => _playlistPointer.previousEntry() ?? _last;

  Future<void> play() async {
    isPlaying = true;
    await player.play();
  }

  Future<void> pause() async {
    isPlaying = false;
    await player.pause();
  }

  Future<void> seek(final Duration position) async {
    await player.seek(position);
    notifyListeners();
  }

  Future<void> stop() async {
    isPlaying = false;
    await stop();
  }

  Future<void> skipToNext() async {
    _playlistPointer = _next;
    track = _playlistPointer.element;
    await player.seekToNext();
  }

  Future<void> skipToPrevious() async {
    _playlistPointer = _prev;
    track = _playlistPointer.element;
    await player.seekToPrevious();
  }

  @override
  Future<void> dispose() async {
    await player.stop();
    notifyListeners();
    await player.dispose();
    playlist.clear();
    super.dispose();
  }
}

@autoequal
class Track extends MediaItem with EquatableMixin implements Comparable<Track> {
  const Track({
    required super.id,
    required super.title,
    required this.url,
    required this.index,
    this.artData,
    this.isStream = true,
    super.album,
    super.artHeaders,
    super.artUri,
    super.artist,
    super.displayDescription,
    super.displaySubtitle,
    super.displayTitle,
    super.duration,
    super.genre,
    super.playable = true,
    super.rating,
  });

  final Uri url;
  final Future<String>? artData;
  final int index;
  final bool isStream;

  @override
  List<Object?> get props => _$props;
  AudioSource get source => AudioSource.uri(url, tag: this);

  @override
  int compareTo(final Track other) {
    if (index == other.index) {
      return 0;
    }
    if (index > other.index) {
      return 1;
    } else {
      return -1;
    }
  }

  bool operator >(final Track other) => compareTo(other) > 0;
  bool operator >=(final Track other) => compareTo(other) >= 0;
  bool operator <(final Track other) => compareTo(other) < 0;
  bool operator <=(final Track other) => compareTo(other) <= 0;
}

extension DurationText on Duration {
  String get text => toString().split('.').first;
}

class TrackPlayerListenable {
  TrackPlayerListenable({required this.isPlaying, required this.track});

  bool isPlaying;
  Track track;
}

class TrackPlayerNotifier extends ChangeNotifier
    implements ValueListenable<TrackPlayerListenable> {
  TrackPlayerNotifier(final TrackPlayerListenable value)
      : _value = value,
        super();

  @override
  TrackPlayerListenable get value => _value;
  final TrackPlayerListenable _value;
  set value(final TrackPlayerListenable newValue) {
    isPlaying = newValue.isPlaying;
    track = newValue.track;
  }

  bool get isPlaying => _value.isPlaying;
  set isPlaying(final bool newValue) {
    if (_value.isPlaying == newValue) {
      return;
    }
    _value.isPlaying = newValue;
    notifyListeners();
  }

  Track get track => _value.track;
  set track(final Track newValue) {
    if (_value.track == newValue) {
      return;
    }
    _value.track = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
