import 'dart:io';

import 'package:flutter/widgets.dart';

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

class MediaPlayerSource {
  final MediaPlayerSourceType type;
  final String assetPath;
  final String assetPackage;
  final File file;
  final String networkUrl;
  final String networkFormatHint;

  MediaPlayerSource._private({
    @required this.type,
    @required this.assetPath,
    @required this.assetPackage,
    @required this.file,
    @required this.networkUrl,
    @required this.networkFormatHint,
  });

  MediaPlayerSource.asset({
    @required String assetPath,
    String assetPackage,
  }) : this._private(
          type: MediaPlayerSourceType.asset,
          assetPath: assetPath,
          assetPackage: assetPackage,
          file: null,
          networkUrl: null,
          networkFormatHint: null,
        );

  MediaPlayerSource.file({
    @required File file,
  }) : this._private(
          type: MediaPlayerSourceType.file,
          assetPath: null,
          assetPackage: null,
          file: file,
          networkUrl: null,
          networkFormatHint: null,
        );

  MediaPlayerSource.network({
    @required String networkUrl,
    String networkFormatHint,
  }) : this._private(
          type: MediaPlayerSourceType.network,
          assetPath: null,
          assetPackage: null,
          file: null,
          networkUrl: networkUrl,
          networkFormatHint: networkFormatHint,
        );

  @override
  String toString() {
    return 'MediaPlayerSource{type: $type, assetPath: $assetPath,'
        ' assetPackage: $assetPackage, file: $file,'
        ' networkUrl: $networkUrl,'
        ' networkFormatHint: $networkFormatHint}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaPlayerSource &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          assetPath == other.assetPath &&
          assetPackage == other.assetPackage &&
          file == other.file &&
          networkUrl == other.networkUrl &&
          networkFormatHint == other.networkFormatHint;

  @override
  int get hashCode =>
      type.hashCode ^
      assetPath.hashCode ^
      assetPackage.hashCode ^
      file.hashCode ^
      networkUrl.hashCode ^
      networkFormatHint.hashCode;
}
