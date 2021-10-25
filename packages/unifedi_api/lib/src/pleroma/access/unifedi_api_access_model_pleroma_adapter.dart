import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/access/level/unifedi_api_access_level_model.dart';
import '../../api/access/token/application/unifedi_api_access_application_token_model.dart';
import '../../api/access/token/user/unifedi_api_access_user_token_model.dart';
import '../../api/access/unifedi_api_access_model.dart';
import '../../api/instance/unifedi_api_instance_model.dart';
import '../instance/unifedi_api_instance_model_pleroma_adapter.dart';
import 'level/unifedi_api_access_level_model_pleroma_adapter.dart';
import 'token/application/unifedi_api_access_application_token_model_pleroma_adapter.dart';
import 'token/user/unifedi_api_access_user_token_model_pleroma_adapter.dart';

part 'unifedi_api_access_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_access_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessPleromaAdapter
    with _$UnifediApiAccessPleromaAdapter
    implements IUnifediApiAccess {
  const UnifediApiAccessPleromaAdapter._();

  const factory UnifediApiAccessPleromaAdapter(
    @HiveField(0) PleromaApiAccess value,
  ) = _UnifediApiAccessPleromaAdapter;

  @override
  IUnifediApiInstance? get instance =>
      value.instance?.toUnifediApiInstancePleromaAdapter();

  @override
  IUnifediApiAccessLevel get level =>
      value.level.toUnifediApiAccessLevelPleromaAdapter();

  @override
  String get url => value.url;

  @override
  IUnifediApiAccessApplicationToken? get applicationAccessToken =>
      value.applicationAccessToken
          ?.toUnifediApiAccessApplicationTokenPleromaAdapter();

  @override
  IUnifediApiAccessUserToken? get userAccessToken =>
      value.userAccessToken?.toUnifediApiAccessUserTokenPleromaAdapter();

  factory UnifediApiAccessPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessPleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiAccess {
  UnifediApiAccessPleromaAdapter toUnifediApiAccessPleromaAdapter() =>
      UnifediApiAccessPleromaAdapter(
        toPleromaApiAccess(),
      );
}

extension UnifediApiAccessPleromaExtension on IUnifediApiAccess {
  PleromaApiAccess toPleromaApiAccess() => PleromaApiAccess(
        url: url,
        instance: instance?.toPleromaApiInstance(),
        applicationAccessToken:
            applicationAccessToken?.toPleromaApiAccessApplicationToken(),
        userAccessToken: userAccessToken?.toPleromaApiAccessUserToken(),
      );
}
