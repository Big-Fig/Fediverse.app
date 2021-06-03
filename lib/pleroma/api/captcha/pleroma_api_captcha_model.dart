import 'package:fedi/json/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_captcha_model.g.dart';

abstract class IPleromaApiCaptcha {
  String? get answerData;

  int? get secondsValid;

  String? get token;

  String? get type;

  PleromaApiCaptchaType? get typeAsPleromaApi;

  String? get url;
}

extension IPleromaApiCaptchaExtension on IPleromaApiCaptcha {
  PleromaApiCaptcha toPleromaApiCaptcha({bool forceNewObject = false}) {
    if (this is PleromaApiCaptcha && !forceNewObject) {
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
class PleromaApiCaptcha implements IPleromaApiCaptcha, IJsonObject {
  @override
  @JsonKey(name: 'answer_data')
  final String? answerData;

  @override
  @JsonKey(name: 'seconds_valid')
  final int? secondsValid;

  @override
  final String? token;

  @override
  final String? type;

  @override
  final String? url;

  @override
  PleromaApiCaptchaType? get typeAsPleromaApi =>
      type?.toPleromaApiCaptchaType();

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

  static PleromaApiCaptcha fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCaptchaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiCaptchaToJson(this);
}

enum PleromaApiCaptchaType {
  unknown,
  native,
  kocaptcha,
  none,
}

const unknownPleromaApiCaptchaType = PleromaApiCaptchaType.unknown;

const _nativePleromaApiCaptchaTypeJsonValue = 'native';
const _kocaptchaPleromaApiCaptchaTypeJsonValue = 'kocaptcha';
const _nonePleromaApiCaptchaTypeJsonValue = 'none';
const _unknownPleromaApiCaptchaTypeJsonValue = 'unknown';

extension PleromaApiCaptchaTypeExtension on PleromaApiCaptchaType {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaApiCaptchaType.native:
        result = _nativePleromaApiCaptchaTypeJsonValue;
        break;
      case PleromaApiCaptchaType.kocaptcha:
        result = _kocaptchaPleromaApiCaptchaTypeJsonValue;
        break;
      case PleromaApiCaptchaType.none:
        result = _nonePleromaApiCaptchaTypeJsonValue;
        break;
      case PleromaApiCaptchaType.unknown:
        result = _unknownPleromaApiCaptchaTypeJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaApiCaptchaTypeStringExtension on String {
  PleromaApiCaptchaType toPleromaApiCaptchaType() {
    PleromaApiCaptchaType result;

    switch (this) {
      case _kocaptchaPleromaApiCaptchaTypeJsonValue:
        result = PleromaApiCaptchaType.kocaptcha;
        break;
      case _nativePleromaApiCaptchaTypeJsonValue:
        result = PleromaApiCaptchaType.native;
        break;
      case _nonePleromaApiCaptchaTypeJsonValue:
        result = PleromaApiCaptchaType.none;
        break;
      case _unknownPleromaApiCaptchaTypeJsonValue:
        result = PleromaApiCaptchaType.unknown;
        break;
      default:
        result = unknownPleromaApiCaptchaType;
        break;
    }

    return result;
  }
}
