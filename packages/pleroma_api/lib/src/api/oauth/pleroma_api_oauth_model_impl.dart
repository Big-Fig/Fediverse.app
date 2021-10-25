import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_oauth_model.dart';

part 'pleroma_api_oauth_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_oauth_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiOAuthToken
    with _$PleromaApiOAuthToken
    implements IPleromaApiOAuthToken {
  const factory PleromaApiOAuthToken({
    @HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
    @HiveField(1) @JsonKey(name: 'token_type') required String tokenType,
    @HiveField(2)
    @JsonKey(fromJson: JsonParseHelper.toStringFromAnyNullable)
        required String? id,
    @HiveField(3) required String? me,
  }) = _PleromaApiOAuthToken;

  factory PleromaApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiOAuthTokenFromJson(json);
}

extension PleromaApiOAuthTokenInterfaceExtension on IPleromaApiOAuthToken {
  PleromaApiOAuthToken toPleromaApiOAuthToken({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiOAuthToken(
          accessToken: accessToken,
          tokenType: tokenType,
          id: id,
          me: me,
        ),
        forceNewObject: forceNewObject,
      );
}
