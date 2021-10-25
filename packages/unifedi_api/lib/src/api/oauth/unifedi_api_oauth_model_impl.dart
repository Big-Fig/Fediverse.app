import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_oauth_model.dart';

part 'unifedi_api_oauth_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_oauth_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiOAuthToken
    with _$UnifediApiOAuthToken
    implements IUnifediApiOAuthToken {
  const factory UnifediApiOAuthToken({
    @HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
    @HiveField(1) @JsonKey(name: 'token_type') required String tokenType,
    @HiveField(2) required String? id,
    @HiveField(3) required String? me,
  }) = _UnifediApiOAuthToken;

  factory UnifediApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiOAuthTokenFromJson(json);
}

extension UnifediApiOAuthTokenInterfaceExtension on IUnifediApiOAuthToken {
  UnifediApiOAuthToken toUnifediApiOAuthToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiOAuthToken(
          accessToken: accessToken,
          tokenType: tokenType,
          id: id,
          me: me,
        ),
        forceNewObject: forceNewObject,
      );
}
