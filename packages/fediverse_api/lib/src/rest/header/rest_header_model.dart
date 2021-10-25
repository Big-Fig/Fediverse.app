import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_header_model.freezed.dart';

@freezed
class RestHeader with _$RestHeader {
  const factory RestHeader({
    required String key,
    required String value,
  }) = _RestHeader;

  static RestHeader authorization({
    required String value,
  }) =>
      RestHeader(
        key: 'Authorization',
        value: value,
      );

  static RestHeader authorizationBearer({
    required String bearer,
  }) =>
      authorization(value: 'Bearer $bearer');
}
