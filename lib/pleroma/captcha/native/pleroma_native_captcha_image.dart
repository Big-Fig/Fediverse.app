import 'dart:convert';

import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:flutter/cupertino.dart';

extension PleromaNativeCaptchaImageExtension on  IPleromaCaptcha {

  Future<Image> decodeImage() {
    assert(pleromaType == PleromaCaptchaType.native);

    var base64decoder = Base64Decoder();

    base64decoder.d

//    BASE64.decode(image1.toString());
//    new Image.memory(image),
  }
}
