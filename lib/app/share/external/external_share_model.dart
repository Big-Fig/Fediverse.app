

class ShareUrlFile {
  final String? url;
  final String? filename;
  ShareUrlFile({required this.url, required this.filename});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareUrlFile &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          filename == other.filename;
  @override
  int get hashCode => url.hashCode ^ filename.hashCode;
  @override
  String toString() {
    return 'ShareUrlFile{url: $url, filename: $filename}';
  }
}
