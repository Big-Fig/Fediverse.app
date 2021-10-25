import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/access/level/unifedi_api_access_level_model.dart';
import '../../api/access/token/application/unifedi_api_access_application_token_model.dart';
import '../../api/access/token/user/unifedi_api_access_user_token_model.dart';
import '../../api/access/unifedi_api_access_model.dart';
import '../../api/instance/unifedi_api_instance_model.dart';
import '../instance/unifedi_api_instance_model_mastodon_adapter.dart';
import 'level/unifedi_api_access_level_model_mastodon_adapter.dart';
import 'token/application/unifedi_api_access_application_token_model_mastodon_adapter.dart';
import 'token/user/unifedi_api_access_user_token_model_mastodon_adapter.dart';

part 'unifedi_api_access_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_access_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccessMastodonAdapter
    with _$UnifediApiAccessMastodonAdapter
    implements IUnifediApiAccess {
  const UnifediApiAccessMastodonAdapter._();

  const factory UnifediApiAccessMastodonAdapter(
    @HiveField(0) MastodonApiAccess value,
  ) = _UnifediApiAccessMastodonAdapter;

  @override
  IUnifediApiInstance? get instance =>
      value.instance?.toUnifediApiInstanceMastodonAdapter();

  @override
  IUnifediApiAccessLevel get level =>
      value.level.toUnifediApiAccessLevelMastodonAdapter();

  @override
  String get url => value.url;

  @override
  IUnifediApiAccessApplicationToken? get applicationAccessToken =>
      value.applicationAccessToken
          ?.toUnifediApiAccessApplicationTokenMastodonAdapter();

  @override
  IUnifediApiAccessUserToken? get userAccessToken =>
      value.userAccessToken?.toUnifediApiAccessUserTokenMastodonAdapter();

  factory UnifediApiAccessMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccessMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiAccess {
  UnifediApiAccessMastodonAdapter toUnifediApiAccessMastodonAdapter() =>
      UnifediApiAccessMastodonAdapter(
        toMastodonApiAccess(),
      );
}

extension UnifediApiAccessMastodonExtension on IUnifediApiAccess {
  MastodonApiAccess toMastodonApiAccess() => MastodonApiAccess(
        url: url,
        instance: instance?.toMastodonApiInstance(),
        applicationAccessToken:
            applicationAccessToken?.toMastodonApiAccessApplicationToken(),
        userAccessToken: userAccessToken?.toMastodonApiAccessUserToken(),
      );
}
