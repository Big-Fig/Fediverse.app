import 'dart:io';

class MediaImageSource {
  final File? file;
  final String? url;

  MediaImageSource({this.file, this.url}) {
    assert(!(file != null && url != null));
    assert(!(file == null && url == null));
  }
}
