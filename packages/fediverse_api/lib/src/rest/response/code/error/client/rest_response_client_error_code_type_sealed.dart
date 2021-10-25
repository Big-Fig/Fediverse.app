import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_response_client_error_code_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestResponseClientErrorCodeType with _$RestResponseClientErrorCodeType {
  static const badRequestIntValue = 400;
  static const unauthorizedIntValue = 401;
  static const paymentRequiredIntValue = 402;
  static const forbiddenIntValue = 403;
  static const notFoundIntValue = 404;
  static const methodNotAllowedIntValue = 405;
  static const notAcceptableIntValue = 406;
  static const proxyAuthenticationRequiredIntValue = 407;
  static const requestTimeoutIntValue = 408;
  static const conflictIntValue = 409;
  static const goneIntValue = 410;
  static const lengthRequiredIntValue = 411;
  static const preconditionFailedIntValue = 412;
  static const payloadTooLargeIntValue = 413;
  static const uriTooLongIntValue = 414;
  static const unsupportedMediaTypeIntValue = 415;
  static const rangeNotSatisfiableIntValue = 416;
  static const expectationFailedIntValue = 417;
  static const iAmTeapotIntValue = 418;
  static const misdirectRequestIntValue = 421;
  static const unprocessableEntityEntityIntValue = 422;
  static const lockedIntValue = 423;
  static const failedDependencyIntValue = 424;
  static const tooEarlyIntValue = 425;
  static const upgradeRequiredIntValue = 426;
  static const preconditionRequiredIntValue = 428;
  static const tooManyRequestsIntValue = 429;
  static const requestHeaderFieldsTooLargeIntValue = 431;
  static const unavailableForLegalReasonsIntValue = 451;

  static const badRequestValue = RestResponseClientErrorCodeType.badRequest();
  static const unauthorizedValue =
      RestResponseClientErrorCodeType.unauthorized();
  static const paymentRequiredValue =
      RestResponseClientErrorCodeType.paymentRequired();
  static const forbiddenValue = RestResponseClientErrorCodeType.forbidden();
  static const notFoundValue = RestResponseClientErrorCodeType.notFound();
  static const methodNotAllowedValue =
      RestResponseClientErrorCodeType.methodNotAllowed();
  static const notAcceptableValue =
      RestResponseClientErrorCodeType.notAcceptable();
  static const proxyAuthenticationRequiredValue =
      RestResponseClientErrorCodeType.proxyAuthenticationRequired();
  static const requestTimeoutValue =
      RestResponseClientErrorCodeType.requestTimeout();
  static const conflictValue = RestResponseClientErrorCodeType.conflict();
  static const lengthRequiredValue =
      RestResponseClientErrorCodeType.lengthRequired();
  static const goneValue = RestResponseClientErrorCodeType.gone();
  static const preconditionFailedValue =
      RestResponseClientErrorCodeType.preconditionFailed();
  static const payloadTooLargeValue =
      RestResponseClientErrorCodeType.payloadTooLarge();
  static const uriTooLongValue = RestResponseClientErrorCodeType.uriTooLong();
  static const unsupportedMediaTypeValue =
      RestResponseClientErrorCodeType.unsupportedMediaType();
  static const rangeNotSatisfiableValue =
      RestResponseClientErrorCodeType.rangeNotSatisfiable();
  static const expectationFailedValue =
      RestResponseClientErrorCodeType.expectationFailed();
  static const iAmTeapotValue = RestResponseClientErrorCodeType.iAmTeapot();
  static const misdirectRequestValue =
      RestResponseClientErrorCodeType.misdirectRequest();
  static const unprocessableEntityEntityValue =
      RestResponseClientErrorCodeType.unprocessableEntityEntity();
  static const lockedValue = RestResponseClientErrorCodeType.locked();
  static const failedDependencyValue =
      RestResponseClientErrorCodeType.failedDependency();
  static const tooEarlyValue = RestResponseClientErrorCodeType.tooEarly();
  static const upgradeRequiredValue =
      RestResponseClientErrorCodeType.upgradeRequired();
  static const preconditionRequiredValue =
      RestResponseClientErrorCodeType.preconditionRequired();
  static const tooManyRequestsValue =
      RestResponseClientErrorCodeType.tooManyRequests();
  static const requestHeaderFieldsTooLargeValue =
      RestResponseClientErrorCodeType.requestHeaderFieldsTooLarge();
  static const unavailableForLegalReasonsValue =
      RestResponseClientErrorCodeType.unavailableForLegalReasons();

  static const values = [
    badRequestValue,
    unauthorizedValue,
    paymentRequiredValue,
    forbiddenValue,
    notFoundValue,
    methodNotAllowedValue,
    notAcceptableValue,
    proxyAuthenticationRequiredValue,
    requestTimeoutValue,
    conflictValue,
    goneValue,
    lengthRequiredValue,
    preconditionFailedValue,
    payloadTooLargeValue,
    uriTooLongValue,
    unsupportedMediaTypeValue,
    rangeNotSatisfiableValue,
    expectationFailedValue,
    iAmTeapotValue,
    misdirectRequestValue,
    unprocessableEntityEntityValue,
    lockedValue,
    failedDependencyValue,
    tooEarlyValue,
    upgradeRequiredValue,
    preconditionRequiredValue,
    tooManyRequestsValue,
    requestHeaderFieldsTooLargeValue,
    unavailableForLegalReasonsValue,
  ];

  const factory RestResponseClientErrorCodeType.badRequest({
    @Default(RestResponseClientErrorCodeType.badRequestIntValue) int intValue,
  }) = _BadRequest;

  const factory RestResponseClientErrorCodeType.unauthorized({
    @Default(RestResponseClientErrorCodeType.unauthorizedIntValue) int intValue,
  }) = _Unauthorized;

  const factory RestResponseClientErrorCodeType.paymentRequired({
    @Default(RestResponseClientErrorCodeType.paymentRequiredIntValue)
        int intValue,
  }) = _PaymentRequired;

  const factory RestResponseClientErrorCodeType.forbidden({
    @Default(RestResponseClientErrorCodeType.forbiddenIntValue) int intValue,
  }) = _Forbidden;

  const factory RestResponseClientErrorCodeType.notFound({
    @Default(RestResponseClientErrorCodeType.notFoundIntValue) int intValue,
  }) = _NotFound;

  const factory RestResponseClientErrorCodeType.methodNotAllowed({
    @Default(RestResponseClientErrorCodeType.methodNotAllowedIntValue)
        int intValue,
  }) = _MethodNotAllowed;

  const factory RestResponseClientErrorCodeType.notAcceptable({
    @Default(RestResponseClientErrorCodeType.notAcceptableIntValue)
        int intValue,
  }) = _NotAcceptable;

  const factory RestResponseClientErrorCodeType.proxyAuthenticationRequired({
    @Default(RestResponseClientErrorCodeType.proxyAuthenticationRequiredIntValue)
        int intValue,
  }) = _ProxyAuthenticationRequired;

  const factory RestResponseClientErrorCodeType.requestTimeout({
    @Default(RestResponseClientErrorCodeType.requestTimeoutIntValue)
        int intValue,
  }) = _RequestTimeout;

  const factory RestResponseClientErrorCodeType.conflict({
    @Default(RestResponseClientErrorCodeType.conflictIntValue) int intValue,
  }) = _Conflict;

  const factory RestResponseClientErrorCodeType.gone({
    @Default(RestResponseClientErrorCodeType.goneIntValue) int intValue,
  }) = _Gone;

  const factory RestResponseClientErrorCodeType.lengthRequired({
    @Default(RestResponseClientErrorCodeType.lengthRequiredIntValue)
        int intValue,
  }) = _LengthRequired;

  const factory RestResponseClientErrorCodeType.preconditionFailed({
    @Default(RestResponseClientErrorCodeType.preconditionFailedIntValue)
        int intValue,
  }) = _PreconditionFailed;

  const factory RestResponseClientErrorCodeType.payloadTooLarge({
    @Default(RestResponseClientErrorCodeType.payloadTooLargeIntValue)
        int intValue,
  }) = _PayloadTooLarge;

  const factory RestResponseClientErrorCodeType.uriTooLong({
    @Default(RestResponseClientErrorCodeType.uriTooLongIntValue) int intValue,
  }) = _UriTooLong;

  const factory RestResponseClientErrorCodeType.unsupportedMediaType({
    @Default(RestResponseClientErrorCodeType.unsupportedMediaTypeIntValue)
        int intValue,
  }) = _UnsupportedMediaType;

  const factory RestResponseClientErrorCodeType.rangeNotSatisfiable({
    @Default(RestResponseClientErrorCodeType.rangeNotSatisfiableIntValue)
        int intValue,
  }) = _RangeNotSatisfiable;

  const factory RestResponseClientErrorCodeType.expectationFailed({
    @Default(RestResponseClientErrorCodeType.expectationFailedIntValue)
        int intValue,
  }) = _ExpectationFailed;

  const factory RestResponseClientErrorCodeType.iAmTeapot({
    @Default(RestResponseClientErrorCodeType.iAmTeapotIntValue) int intValue,
  }) = _IAmTeapot;

  const factory RestResponseClientErrorCodeType.misdirectRequest({
    @Default(RestResponseClientErrorCodeType.misdirectRequestIntValue)
        int intValue,
  }) = _MisdirectRequest;

  const factory RestResponseClientErrorCodeType.unprocessableEntityEntity({
    @Default(RestResponseClientErrorCodeType.unprocessableEntityEntityIntValue)
        int intValue,
  }) = _UnprocessableEntityEntity;

  const factory RestResponseClientErrorCodeType.locked({
    @Default(RestResponseClientErrorCodeType.lockedIntValue) int intValue,
  }) = _Locked;

  const factory RestResponseClientErrorCodeType.failedDependency({
    @Default(RestResponseClientErrorCodeType.failedDependencyIntValue)
        int intValue,
  }) = _FailedDependency;

  const factory RestResponseClientErrorCodeType.tooEarly({
    @Default(RestResponseClientErrorCodeType.tooEarlyIntValue) int intValue,
  }) = _TooEarly;

  const factory RestResponseClientErrorCodeType.upgradeRequired({
    @Default(RestResponseClientErrorCodeType.upgradeRequiredIntValue)
        int intValue,
  }) = _UpgradeRequired;

  const factory RestResponseClientErrorCodeType.preconditionRequired({
    @Default(RestResponseClientErrorCodeType.preconditionRequiredIntValue)
        int intValue,
  }) = _PreconditionRequired;

  const factory RestResponseClientErrorCodeType.tooManyRequests({
    @Default(RestResponseClientErrorCodeType.tooManyRequestsIntValue)
        int intValue,
  }) = _TooManyRequests;

  const factory RestResponseClientErrorCodeType.requestHeaderFieldsTooLarge({
    @Default(RestResponseClientErrorCodeType.requestHeaderFieldsTooLargeIntValue)
        int intValue,
  }) = _RequestHeaderFieldsTooLarge;

  const factory RestResponseClientErrorCodeType.unavailableForLegalReasons({
    @Default(RestResponseClientErrorCodeType.unavailableForLegalReasonsIntValue)
        int intValue,
  }) = _UnavailableForLegalReasons;

  static RestResponseClientErrorCodeType detectByStatusCode(int statusCode) =>
      RestResponseClientErrorCodeType.values.firstWhere(
        (type) => type.intValue == statusCode,
      );
}
