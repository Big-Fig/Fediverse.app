import 'dart:convert';

import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:flutter/cupertino.dart';

extension PleromaNativeCaptchaImageExtension on IPleromaCaptcha {
  Image decodeImage() {
    assert(pleromaType == PleromaCaptchaType.native);

    String encoded = url;

    // actually encoded url looks like 'data:image/png;base64,R0lGODlhyABGAIMA'
    // in this case we should cut header data and make plain base64 string
    // Otherwise wi think it is plain base64 text
    // if url field don't have ','
    if (encoded.contains(",")) {
      var split = encoded.split(",");
      assert(split.length == 2, "Invalid encoded url $encoded");

      var base64Part = split[1];

      encoded = base64Part;
    }

    var bytes = base64.decode(encoded);

    return Image.memory(bytes);
  }
}
