class DownloadTempFileRequest {
  final String url;
  final String filenameWithExtension;

  DownloadTempFileRequest({
    required this.url,
    required this.filenameWithExtension,
  });


  @override
  String toString() {
    return 'DownloadTempFileRequest{'
        'url: $url, '
        'filename: $filenameWithExtension'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadTempFileRequest &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          filenameWithExtension == other.filenameWithExtension;

  @override
  int get hashCode => url.hashCode ^ filenameWithExtension.hashCode;
}
