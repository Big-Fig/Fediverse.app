import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_captcha_model.g.dart';

abstract class IPleromaApiCaptcha {
  String? get answerData;

  int? get secondsValid;

  String? get token;

  String? get type;

  PleromaApiCaptchaType get typeAsPleromaApi;

  String? get url;
}

extension IPleromaApiCaptchaExtension on IPleromaApiCaptcha {
  PleromaApiCaptcha toPleromaApiCaptcha() {
    if (this is PleromaApiCaptcha) {
      return this as PleromaApiCaptcha;
    } else {
      return PleromaApiCaptcha(
        answerData: answerData,
        secondsValid: secondsValid,
        token: token,
        type: type,
        url: url,
      );
    }
  }
}

@JsonSerializable()
class PleromaApiCaptcha implements IPleromaApiCaptcha {
  @override
  @JsonKey(name: "answer_data")
  final String? answerData;

  @override
  @JsonKey(name: "seconds_valid")
  final int? secondsValid;

  @override
  final String? token;

  @override
  final String? type;

  @override
  final String? url;

  @override
  PleromaApiCaptchaType get typeAsPleromaApi {
    switch (type) {
      case "native":
        return PleromaApiCaptchaType.native;
      case "none":
        return PleromaApiCaptchaType.none;
      case "kocaptcha":
        return PleromaApiCaptchaType.kocaptcha;
    }

    return PleromaApiCaptchaType.unknown;
  }

  PleromaApiCaptcha({
    required this.answerData,
    required this.secondsValid,
    required this.token,
    required this.type,
    required this.url,
  });

  @override
  String toString() {
    return 'PleromaApiCaptcha{'
        'answerData: $answerData, '
        'secondsValid: $secondsValid, '
        'token: $token,'
        'type: $type, '
        'url: $url'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiCaptcha &&
          runtimeType == other.runtimeType &&
          answerData == other.answerData &&
          secondsValid == other.secondsValid &&
          token == other.token &&
          type == other.type &&
          url == other.url;

  @override
  int get hashCode =>
      answerData.hashCode ^
      secondsValid.hashCode ^
      token.hashCode ^
      type.hashCode ^
      url.hashCode;

  factory PleromaApiCaptcha.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCaptchaFromJson(json);

  factory PleromaApiCaptcha.fromJsonString(String jsonString) =>
      _$PleromaApiCaptchaFromJson(jsonDecode(jsonString));

  static List<PleromaApiCaptcha> listFromJsonString(String str) =>
      List<PleromaApiCaptcha>.from(
        json.decode(str).map((x) => PleromaApiCaptcha.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiCaptchaToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiCaptchaToJson(this));
}

enum PleromaApiCaptchaType {
  unknown,
  native,
  kocaptcha,
  none,
}
