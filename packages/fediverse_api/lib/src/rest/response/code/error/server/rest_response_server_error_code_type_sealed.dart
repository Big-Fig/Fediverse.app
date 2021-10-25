import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_response_server_error_code_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestResponseServerErrorCodeType with _$RestResponseServerErrorCodeType {
  static const internalServerErrorIntValue = 500;
  static const notImplementedIntValue = 501;
  static const badGatewayIntValue = 502;
  static const serviceUnavailableIntValue = 503;
  static const gatewayTimeoutIntValue = 504;
  static const httpNotSupportedIntValue = 505;
  static const variantAlsoNegotiatesIntValue = 506;
  static const insufficientStorageIntValue = 507;
  static const loopDetectedIntValue = 508;
  static const notExtendedIntValue = 510;
  static const networkAuthenticationRequiredIntValue = 511;

  static const internalServerErrorValue =
      RestResponseServerErrorCodeType.internalServerError();
  static const notImplementedValue =
      RestResponseServerErrorCodeType.notImplemented();
  static const badGatewayValue = RestResponseServerErrorCodeType.badGateway();
  static const serviceUnavailableValue =
      RestResponseServerErrorCodeType.serviceUnavailable();
  static const gatewayTimeoutValue =
      RestResponseServerErrorCodeType.gatewayTimeout();
  static const httpNotSupportedValue =
      RestResponseServerErrorCodeType.httpNotSupported();
  static const variantAlsoNegotiatesValue =
      RestResponseServerErrorCodeType.variantAlsoNegotiates();
  static const insufficientStorageValue =
      RestResponseServerErrorCodeType.insufficientStorage();
  static const loopDetectedValue =
      RestResponseServerErrorCodeType.loopDetected();
  static const notExtendedValue = RestResponseServerErrorCodeType.notExtended();
  static const networkAuthenticationRequiredValue =
      RestResponseServerErrorCodeType.networkAuthenticationRequired();

  static const values = [
    internalServerErrorValue,
    notImplementedValue,
    badGatewayValue,
    serviceUnavailableValue,
    gatewayTimeoutValue,
    httpNotSupportedValue,
    variantAlsoNegotiatesValue,
    insufficientStorageValue,
    loopDetectedValue,
    notExtendedValue,
    networkAuthenticationRequiredValue,
  ];

  const factory RestResponseServerErrorCodeType.internalServerError({
    @Default(RestResponseServerErrorCodeType.internalServerErrorIntValue)
        int intValue,
  }) = _InternalServerError;

  const factory RestResponseServerErrorCodeType.notImplemented({
    @Default(RestResponseServerErrorCodeType.notImplementedIntValue)
        int intValue,
  }) = _NotImplemented;

  const factory RestResponseServerErrorCodeType.badGateway({
    @Default(RestResponseServerErrorCodeType.badGatewayIntValue) int intValue,
  }) = _BadGateway;

  const factory RestResponseServerErrorCodeType.serviceUnavailable({
    @Default(RestResponseServerErrorCodeType.serviceUnavailableIntValue)
        int intValue,
  }) = _ServiceUnavailable;

  const factory RestResponseServerErrorCodeType.gatewayTimeout({
    @Default(RestResponseServerErrorCodeType.gatewayTimeoutIntValue)
        int intValue,
  }) = _GatewayTimeout;

  const factory RestResponseServerErrorCodeType.httpNotSupported({
    @Default(RestResponseServerErrorCodeType.httpNotSupportedIntValue)
        int intValue,
  }) = _HttpNotSupported;

  const factory RestResponseServerErrorCodeType.variantAlsoNegotiates({
    @Default(RestResponseServerErrorCodeType.variantAlsoNegotiatesIntValue)
        int intValue,
  }) = _VariantAlsoNegotiates;

  const factory RestResponseServerErrorCodeType.insufficientStorage({
    @Default(RestResponseServerErrorCodeType.insufficientStorageIntValue)
        int intValue,
  }) = _InsufficientStorage;

  const factory RestResponseServerErrorCodeType.loopDetected({
    @Default(RestResponseServerErrorCodeType.loopDetectedIntValue) int intValue,
  }) = _LoopDetected;

  const factory RestResponseServerErrorCodeType.notExtended({
    @Default(RestResponseServerErrorCodeType.notExtendedIntValue) int intValue,
  }) = _NotExtended;

  const factory RestResponseServerErrorCodeType.networkAuthenticationRequired({
    @Default(RestResponseServerErrorCodeType.networkAuthenticationRequiredIntValue)
        int intValue,
  }) = _NetworkAuthenticationRequired;

  static RestResponseServerErrorCodeType detectByStatusCode(int statusCode) =>
      RestResponseServerErrorCodeType.values.firstWhere(
        (type) => type.intValue == statusCode,
      );
}
