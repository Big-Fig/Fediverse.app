import 'package:path/path.dart' as path;

class ShareUrlFile {
  final String url;
  final String filenameWithExtension;

  ShareUrlFile({
    required this.url,
    required this.filenameWithExtension,
  });

  ShareUrlFile.fromUrl({
    required String url,
  }) : this(
          url: url,
          filenameWithExtension: path.basename(url),
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareUrlFile &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          filenameWithExtension == other.filenameWithExtension;

  @override
  int get hashCode => url.hashCode ^ filenameWithExtension.hashCode;

  @override
  String toString() {
    return 'ShareUrlFile{'
        'url: $url, '
        'filename: $filenameWithExtension'
        '}';
  }
}
