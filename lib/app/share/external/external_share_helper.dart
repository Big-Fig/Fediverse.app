import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class ExternalShareHelper {

  static final textMimeType = "text/plain";
  static Future<Uint8List> loadBytesFromUrl(String url) async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }
}
