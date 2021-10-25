import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_response_redirect_code_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestResponseRedirectCodeType with _$RestResponseRedirectCodeType {
  static const multipleChoiceIntValue = 300;
  static const movedIntValue = 301;
  static const foundIntValue = 302;
  static const seeOtherIntValue = 303;
  static const notModifiedIntValue = 304;
  static const useProxyIntValue = 305;
  static const unusedIntValue = 306;
  static const temporaryRedirectIntValue = 307;
  static const permanentRedirectIntValue = 308;

  static const multipleChoiceValue =
      RestResponseRedirectCodeType.multipleChoice();
  static const movedValue = RestResponseRedirectCodeType.moved();
  static const foundValue = RestResponseRedirectCodeType.found();
  static const seeOtherValue = RestResponseRedirectCodeType.seeOther();
  static const notModifiedValue = RestResponseRedirectCodeType.notModified();
  static const useProxyValue = RestResponseRedirectCodeType.useProxy();
  static const unusedValue = RestResponseRedirectCodeType.unused();
  static const temporaryRedirectValue =
      RestResponseRedirectCodeType.temporaryRedirect();
  static const permanentRedirectValue =
      RestResponseRedirectCodeType.permanentRedirect();

  static const values = [
    multipleChoiceValue,
    movedValue,
    foundValue,
    seeOtherValue,
    notModifiedValue,
    useProxyValue,
    unusedValue,
    temporaryRedirectValue,
    permanentRedirectValue,
  ];

  const factory RestResponseRedirectCodeType.multipleChoice({
    @Default(RestResponseRedirectCodeType.multipleChoiceIntValue) int intValue,
  }) = _MultipleChoice;

  const factory RestResponseRedirectCodeType.moved({
    @Default(RestResponseRedirectCodeType.movedIntValue) int intValue,
  }) = _Moved;

  const factory RestResponseRedirectCodeType.found({
    @Default(RestResponseRedirectCodeType.foundIntValue) int intValue,
  }) = _Found;

  const factory RestResponseRedirectCodeType.seeOther({
    @Default(RestResponseRedirectCodeType.seeOtherIntValue) int intValue,
  }) = _SeeOther;

  const factory RestResponseRedirectCodeType.notModified({
    @Default(RestResponseRedirectCodeType.notModifiedIntValue) int intValue,
  }) = _NotModified;

  const factory RestResponseRedirectCodeType.useProxy({
    @Default(RestResponseRedirectCodeType.useProxyIntValue) int intValue,
  }) = _UseProxy;

  const factory RestResponseRedirectCodeType.unused({
    @Default(RestResponseRedirectCodeType.unusedIntValue) int intValue,
  }) = _Unused;

  const factory RestResponseRedirectCodeType.temporaryRedirect({
    @Default(RestResponseRedirectCodeType.temporaryRedirectIntValue)
        int intValue,
  }) = _TemporaryRedirect;

  const factory RestResponseRedirectCodeType.permanentRedirect({
    @Default(RestResponseRedirectCodeType.permanentRedirectIntValue)
        int intValue,
  }) = _PermanentRedirect;

  static RestResponseRedirectCodeType detectByStatusCode(int statusCode) =>
      RestResponseRedirectCodeType.values.firstWhere(
        (type) => type.intValue == statusCode,
      );
}
