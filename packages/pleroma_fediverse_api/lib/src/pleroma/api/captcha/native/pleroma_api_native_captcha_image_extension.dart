import 'dart:convert';
import 'dart:typed_data';

import 'package:pleroma_fediverse_api/src/pleroma/api/captcha/pleroma_api_captcha_model.dart';

extension PleromaApiNativeCaptchaImageExtension on IPleromaApiCaptcha {
  Uint8List decodeUrlAsBase64ImageBytes() {
    assert(typeAsPleromaApi == PleromaApiCaptchaType.native);

    var encoded = url!;

    // actually encoded url looks like 'data:image/png;base64,R0lGODlhyABGAIMA'
    // in this case we should cut header data and make plain base64 string
    // Otherwise wi think it is plain base64 text
    // if url field dont have ','
    if (encoded.contains(',')) {
      var split = encoded.split(',');
      // ignore: no-magic-number
      assert(split.length == 2, 'Invalid encoded url $encoded');

      var base64Part = split[1];

      encoded = base64Part;
    }

    var bytes = base64.decode(encoded);

    return bytes;
  }
}
