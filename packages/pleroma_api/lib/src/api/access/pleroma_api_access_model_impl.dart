import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../instance/pleroma_api_instance_model_impl.dart';
import 'level/pleroma_api_access_level_model.dart';
import 'level/pleroma_api_access_level_model_impl.dart';
import 'pleroma_api_access_model.dart';
import 'token/application/pleroma_api_access_application_token_model_impl.dart';
import 'token/user/pleroma_api_access_user_token_model_impl.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_access_model_impl.freezed.dart';

part 'pleroma_api_access_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class PleromaApiAccess with _$PleromaApiAccess implements IPleromaApiAccess {
  const PleromaApiAccess._();

  const factory PleromaApiAccess({
    @HiveField(0) required String url,
    @HiveField(1) required PleromaApiInstance? instance,
    @HiveField(4)
    @JsonKey(name: 'application_access_token')
        required PleromaApiAccessApplicationToken? applicationAccessToken,
    @HiveField(5)
    @JsonKey(name: 'user_access_token')
        required PleromaApiAccessUserToken? userAccessToken,
  }) = _PleromaApiAccess;

  factory PleromaApiAccess.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccessFromJson(json);

  @override
  IPleromaApiAccessLevel get level {
    IPleromaApiAccessLevel result;
    if (userAccessToken != null) {
      result = PleromaApiAccessLevel.user;
    } else if (applicationAccessToken != null) {
      result = PleromaApiAccessLevel.application;
    } else {
      result = PleromaApiAccessLevel.public;
    }

    return result;
  }
}

extension IPleromaApiAccessInterfaceExtension on IPleromaApiAccess {
  PleromaApiAccess toPleromaApiAccess({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAccess(
          url: url,
          instance: instance?.toPleromaApiInstance(
            forceNewObject: forceNewObject,
          ),
          applicationAccessToken:
              applicationAccessToken?.toPleromaApiAccessApplicationToken(
            forceNewObject: forceNewObject,
          ),
          userAccessToken: userAccessToken?.toPleromaApiAccessUserToken(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
