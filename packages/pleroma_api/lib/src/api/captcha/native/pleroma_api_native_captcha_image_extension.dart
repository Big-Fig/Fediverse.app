import 'dart:convert';
import 'dart:typed_data';

import '../pleroma_api_captcha_model.dart';
import '../type/pleroma_api_captcha_type_sealed.dart';

extension PleromaApiNativeCaptchaImageExtension on IPleromaApiCaptcha {
  Uint8List decodeUrlAsBase64ImageBytes() {
    assert(
      typeAsPleromaApi == PleromaApiCaptchaType.nativeValue,
      'it is possible to decode only native captcha type',
    );

    var encodedBytesAsString = url;

    if (encodedBytesAsString != null && encodedBytesAsString.isNotEmpty) {
      // actually encodedBytesAsString url looks like 'data:image/png;base64,R0lGODlhyABGAIMA'
      // in this case we should cut header data and make plain base64 string
      // Otherwise wi think it is plain base64 text
      // if url field dont have ','
      if (encodedBytesAsString.contains(',')) {
        var split = encodedBytesAsString.split(',');
        assert(
          // ignore: no-magic-number
          split.length == 2,
          'Invalid encodedBytesAsString url $encodedBytesAsString',
        );

        var base64Part = split[1];

        encodedBytesAsString = base64Part;
      }

      var bytes = base64.decode(encodedBytesAsString);

      return bytes;
    } else {
      throw ArgumentError('Url is empty, cant decode');
    }
  }
}
