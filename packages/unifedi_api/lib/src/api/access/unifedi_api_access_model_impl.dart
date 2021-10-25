import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../instance/unifedi_api_instance_model_impl.dart';
import 'level/unifedi_api_access_level_model.dart';
import 'level/unifedi_api_access_level_model_impl.dart';
import 'token/application/unifedi_api_access_application_token_model_impl.dart';
import 'token/user/unifedi_api_access_user_token_model_impl.dart';
import 'unifedi_api_access_model.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_access_model_impl.freezed.dart';

part 'unifedi_api_access_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccess with _$UnifediApiAccess implements IUnifediApiAccess {
  const UnifediApiAccess._();

  const factory UnifediApiAccess({
    @HiveField(0) required String url,
    @HiveField(1) required UnifediApiInstance? instance,
    @HiveField(4)
    @JsonKey(name: 'application_access_token')
        required UnifediApiAccessApplicationToken? applicationAccessToken,
    @HiveField(5)
    @JsonKey(name: 'user_access_token')
        required UnifediApiAccessUserToken? userAccessToken,
  }) = _UnifediApiAccess;

  factory UnifediApiAccess.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessFromJson(json);

  @override
  IUnifediApiAccessLevel get level {
    IUnifediApiAccessLevel result;
    if (userAccessToken != null) {
      result = UnifediApiAccessLevel.user;
    } else if (applicationAccessToken != null) {
      result = UnifediApiAccessLevel.application;
    } else {
      result = UnifediApiAccessLevel.public;
    }

    return result;
  }
}

extension IUnifediApiAccessInterfaceExtension on IUnifediApiAccess {
  UnifediApiAccess toUnifediApiAccess({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiAccess(
          url: url,
          instance: instance?.toUnifediApiInstance(
            forceNewObject: forceNewObject,
          ),
          applicationAccessToken:
              applicationAccessToken?.toUnifediApiAccessApplicationToken(
            forceNewObject: forceNewObject,
          ),
          userAccessToken: userAccessToken?.toUnifediApiAccessUserToken(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
