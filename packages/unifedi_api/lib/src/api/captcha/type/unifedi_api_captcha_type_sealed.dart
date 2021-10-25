import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../unifedi_api_model.dart';

part 'unifedi_api_captcha_type_sealed.freezed.dart';

@freezed
class UnifediApiCaptchaType
    with _$UnifediApiCaptchaType
    implements IUnifediApiUnion {
  static const nativeStringValue = 'native';
  static const kocaptchaStringValue = 'kocaptcha';
  static const noneStringValue = 'none';
  static const nativeValue = UnifediApiCaptchaType.native();
  static const kocaptchaValue = UnifediApiCaptchaType.kocaptcha();
  static const noneValue = UnifediApiCaptchaType.none();

  static const values = [
    nativeValue,
    kocaptchaValue,
    noneValue,
  ];

  const factory UnifediApiCaptchaType.native({
    @Default(UnifediApiCaptchaType.nativeStringValue) String stringValue,
  }) = _Native;

  const factory UnifediApiCaptchaType.kocaptcha({
    @Default(UnifediApiCaptchaType.kocaptchaStringValue) String stringValue,
  }) = _Kocaptcha;

  const factory UnifediApiCaptchaType.none({
    @Default(UnifediApiCaptchaType.noneStringValue) String stringValue,
  }) = _None;

  const factory UnifediApiCaptchaType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiCaptchaType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => UnifediApiCaptchaType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiCaptchaTypeStringExtension on String {
  UnifediApiCaptchaType toUnifediApiCaptchaType() =>
      UnifediApiCaptchaType.fromStringValue(this);
}

extension UnifediApiCaptchaTypeStringListExtension on List<String> {
  List<UnifediApiCaptchaType> toUnifediApiCaptchaTypeList() =>
      map((stringValue) => stringValue.toUnifediApiCaptchaType()).toList();
}
