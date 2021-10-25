import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_captcha_type_sealed.freezed.dart';

@freezed
class PleromaApiCaptchaType
    with _$PleromaApiCaptchaType
    implements IPleromaApiUnion {
  static const nativeStringValue = 'native';
  static const kocaptchaStringValue = 'kocaptcha';
  static const noneStringValue = 'none';
  static const nativeValue = PleromaApiCaptchaType.native();
  static const kocaptchaValue = PleromaApiCaptchaType.kocaptcha();
  static const noneValue = PleromaApiCaptchaType.none();

  static const values = [
    nativeValue,
    kocaptchaValue,
    noneValue,
  ];

  const factory PleromaApiCaptchaType.native({
    @Default(PleromaApiCaptchaType.nativeStringValue) String stringValue,
  }) = _Native;

  const factory PleromaApiCaptchaType.kocaptcha({
    @Default(PleromaApiCaptchaType.kocaptchaStringValue) String stringValue,
  }) = _Kocaptcha;

  const factory PleromaApiCaptchaType.none({
    @Default(PleromaApiCaptchaType.noneStringValue) String stringValue,
  }) = _None;

  const factory PleromaApiCaptchaType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiCaptchaType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => PleromaApiCaptchaType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiCaptchaTypeStringExtension on String {
  PleromaApiCaptchaType toPleromaApiCaptchaType() =>
      PleromaApiCaptchaType.fromStringValue(this);
}

extension PleromaApiCaptchaTypeStringListExtension on List<String> {
  List<PleromaApiCaptchaType> toPleromaApiCaptchaTypeList() =>
      map((stringValue) => stringValue.toPleromaApiCaptchaType()).toList();
}
