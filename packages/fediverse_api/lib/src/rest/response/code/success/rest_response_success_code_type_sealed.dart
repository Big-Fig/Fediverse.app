import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_response_success_code_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestResponseSuccessCodeType with _$RestResponseSuccessCodeType {
  static const okIntValue = 200;
  static const createdIntValue = 201;
  static const acceptedIntValue = 202;
  static const nonAuthoritativeInformationIntValue = 203;
  static const noContentIntValue = 204;
  static const resetContentIntValue = 205;
  static const partialContentIntValue = 206;
  static const multiStatusIntValue = 207;
  static const alreadyReportedIntValue = 208;
  static const imUsedIntValue = 226;

  static const okValue = RestResponseSuccessCodeType.ok();
  static const createdValue = RestResponseSuccessCodeType.created();
  static const acceptedValue = RestResponseSuccessCodeType.accepted();
  static const nonAuthoritativeInformationValue =
      RestResponseSuccessCodeType.nonAuthoritativeInformation();
  static const noContentValue = RestResponseSuccessCodeType.noContent();
  static const resetContentValue = RestResponseSuccessCodeType.resetContent();
  static const partialContentValue =
      RestResponseSuccessCodeType.partialContent();
  static const multiStatusValue = RestResponseSuccessCodeType.multiStatus();
  static const alreadyReportedValue =
      RestResponseSuccessCodeType.alreadyReported();
  static const imUsedValue = RestResponseSuccessCodeType.imUsed();

  static const values = [
    okValue,
    createdValue,
    acceptedValue,
    nonAuthoritativeInformationValue,
    noContentValue,
    resetContentValue,
    partialContentValue,
    multiStatusValue,
    alreadyReportedValue,
    imUsedValue,
  ];

  const factory RestResponseSuccessCodeType.ok({
    @Default(RestResponseSuccessCodeType.okIntValue) int intValue,
  }) = _Ok;

  const factory RestResponseSuccessCodeType.created({
    @Default(RestResponseSuccessCodeType.createdIntValue) int intValue,
  }) = _Created;

  const factory RestResponseSuccessCodeType.accepted({
    @Default(RestResponseSuccessCodeType.acceptedIntValue) int intValue,
  }) = _Accepted;

  const factory RestResponseSuccessCodeType.nonAuthoritativeInformation({
    @Default(RestResponseSuccessCodeType.nonAuthoritativeInformationIntValue)
        int intValue,
  }) = _NonAuthoritativeInformation;

  const factory RestResponseSuccessCodeType.noContent({
    @Default(RestResponseSuccessCodeType.noContentIntValue) int intValue,
  }) = _NoContent;

  const factory RestResponseSuccessCodeType.resetContent({
    @Default(RestResponseSuccessCodeType.resetContentIntValue) int intValue,
  }) = _ResetContent;

  const factory RestResponseSuccessCodeType.partialContent({
    @Default(RestResponseSuccessCodeType.partialContentIntValue) int intValue,
  }) = _PartialContent;

  const factory RestResponseSuccessCodeType.multiStatus({
    @Default(RestResponseSuccessCodeType.multiStatusIntValue) int intValue,
  }) = _MultiStatus;

  const factory RestResponseSuccessCodeType.alreadyReported({
    @Default(RestResponseSuccessCodeType.alreadyReportedIntValue) int intValue,
  }) = _AlreadyReported;

  const factory RestResponseSuccessCodeType.imUsed({
    @Default(RestResponseSuccessCodeType.imUsedIntValue) int intValue,
  }) = _ImUsed;

  static RestResponseSuccessCodeType detectByStatusCode(int statusCode) =>
      RestResponseSuccessCodeType.values.firstWhere(
        (type) => type.intValue == statusCode,
      );
}
