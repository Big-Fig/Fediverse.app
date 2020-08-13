import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_captcha_model.g.dart';

abstract class IPleromaCaptcha {
  String get answerData;

  int get secondsValid;

  String get token;

  String get type;

  PleromaCaptchaType get pleromaType;

  String get url;
}

@JsonSerializable()
class PleromaCaptcha implements IPleromaCaptcha {
  @override
  @JsonKey(name: "answer_data")
  final String answerData;

  @override
  @JsonKey(name: "seconds_valid")
  final int secondsValid;

  @override
  final String token;

  @override
  final String type;

  @override
  final String url;

  @override
  PleromaCaptchaType get pleromaType {
    switch (type) {
      case "native":
        return PleromaCaptchaType.native;
    }

    return PleromaCaptchaType.unknown;
  }

  PleromaCaptcha({
    @required this.answerData,
    @required this.secondsValid,
    @required this.token,
    @required this.type,
    @required this.url,
  });

  @override
  String toString() {
    return 'PleromaCaptcha{answerData: $answerData,'
        ' secondsValid: $secondsValid, token: $token,'
        ' type: $type, url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaCaptcha &&
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

  factory PleromaCaptcha.fromJson(Map<String, dynamic> json) =>
      _$PleromaCaptchaFromJson(json);

  factory PleromaCaptcha.fromJsonString(String jsonString) =>
      _$PleromaCaptchaFromJson(jsonDecode(jsonString));

  static List<PleromaCaptcha> listFromJsonString(String str) =>
      List<PleromaCaptcha>.from(
          json.decode(str).map((x) => PleromaCaptcha.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaCaptchaToJson(this);

  String toJsonString() => jsonEncode(_$PleromaCaptchaToJson(this));
}

enum PleromaCaptchaType {
  unknown,
  native,
}
