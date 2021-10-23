import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_player_model.freezed.dart';

enum MediaPlayerState {
  notInitialized,
  initializing,
  initialized,
  paused,
  playing,
  finished,
  disposed,
  error,
}

enum MediaPlayerSourceType {
  asset,
  file,
  network,
}

@freezed
class MediaPlayerSource with _$MediaPlayerSource {
  const factory MediaPlayerSource({
    required MediaPlayerSourceType type,
    required String? assetPath,
    required String? assetPackage,
    required File? file,
    required String? networkUrl,
    required String? networkFormatHint,
  }) = _MediaPlayerSource;

  static MediaPlayerSource asset({
    required String assetPath,
    String? assetPackage,
  }) =>
      MediaPlayerSource(
        type: MediaPlayerSourceType.asset,
        assetPath: assetPath,
        assetPackage: assetPackage,
        file: null,
        networkUrl: null,
        networkFormatHint: null,
      );

  static MediaPlayerSource localFile({
    required File file,
  }) =>
      MediaPlayerSource(
        type: MediaPlayerSourceType.file,
        assetPath: null,
        assetPackage: null,
        file: file,
        networkUrl: null,
        networkFormatHint: null,
      );

  static MediaPlayerSource network({
    required String? networkUrl,
    String? networkFormatHint,
  }) =>
      MediaPlayerSource(
        type: MediaPlayerSourceType.network,
        assetPath: null,
        assetPackage: null,
        file: null,
        networkUrl: networkUrl,
        networkFormatHint: networkFormatHint,
      );
}
