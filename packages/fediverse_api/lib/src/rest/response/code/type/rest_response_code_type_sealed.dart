import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_response_code_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestResponseCodeType with _$RestResponseCodeType {
  static const infoStringValue = 'info';
  static const successStringValue = 'success';
  static const redirectStringValue = 'redirect';
  static const clientErrorStringValue = 'clientError';
  static const serverErrorStringValue = 'serverError';

  static const infoValue = RestResponseCodeType.info();
  static const successValue = RestResponseCodeType.success();
  static const redirectValue = RestResponseCodeType.redirect();
  static const clientErrorValue = RestResponseCodeType.clientError();
  static const serverErrorValue = RestResponseCodeType.serverError();

  static const values = [
    infoValue,
    successValue,
    redirectValue,
    clientErrorValue,
    serverErrorValue,
  ];

  const factory RestResponseCodeType.info({
    @Default(RestResponseCodeType.infoStringValue) String stringValue,
    @Default(100) int minCode,
    @Default(199) int maxCode,
  }) = _Info;

  const factory RestResponseCodeType.success({
    @Default(RestResponseCodeType.successStringValue) String stringValue,
    @Default(200) int minCode,
    @Default(299) int maxCode,
  }) = _Success;

  const factory RestResponseCodeType.redirect({
    @Default(RestResponseCodeType.redirectStringValue) String stringValue,
    @Default(300) int minCode,
    @Default(399) int maxCode,
  }) = _Redirect;

  const factory RestResponseCodeType.clientError({
    @Default(RestResponseCodeType.clientErrorStringValue) String stringValue,
    @Default(400) int minCode,
    @Default(499) int maxCode,
  }) = _ClientError;

  const factory RestResponseCodeType.serverError({
    @Default(RestResponseCodeType.serverErrorStringValue) String stringValue,
    @Default(500) int minCode,
    @Default(599) int maxCode,
  }) = _ServerError;

  static RestResponseCodeType detectByStatusCode(int statusCode) =>
      RestResponseCodeType.values.firstWhere(
        (type) => type.minCode <= statusCode && type.maxCode >= statusCode,
      );
}

extension RestResponseCodeTypeExtension on RestResponseCodeType {
  bool get isSuccess => maybeMap(
        success: (_) => true,
        orElse: () => false,
      );
}
