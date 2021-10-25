import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_response_info_code_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestResponseInfoCodeType with _$RestResponseInfoCodeType {
  static const continueOkIntValue = 100;
  static const switchingProtocolIntValue = 101;
  static const processingIntValue = 102;
  static const earlyHintsIntValue = 103;

  static const continueOkValue = RestResponseInfoCodeType.continueOk();
  static const switchingProtocolValue =
      RestResponseInfoCodeType.switchingProtocol();
  static const processingValue = RestResponseInfoCodeType.processing();
  static const earlyHintsValue = RestResponseInfoCodeType.earlyHints();

  static const values = [
    continueOkValue,
    switchingProtocolValue,
    processingValue,
    earlyHintsValue,
  ];

  const factory RestResponseInfoCodeType.continueOk({
    @Default(RestResponseInfoCodeType.continueOkIntValue) int intValue,
  }) = _ContinueOk;

  const factory RestResponseInfoCodeType.switchingProtocol({
    @Default(RestResponseInfoCodeType.switchingProtocolIntValue) int intValue,
  }) = _SwitchingProtocol;

  const factory RestResponseInfoCodeType.processing({
    @Default(RestResponseInfoCodeType.processingIntValue) int intValue,
  }) = _Processing;

  const factory RestResponseInfoCodeType.earlyHints({
    @Default(RestResponseInfoCodeType.earlyHintsIntValue) int intValue,
  }) = _EarlyHints;

  static RestResponseInfoCodeType detectByStatusCode(int statusCode) =>
      RestResponseInfoCodeType.values.firstWhere(
        (type) => type.intValue == statusCode,
      );
}
