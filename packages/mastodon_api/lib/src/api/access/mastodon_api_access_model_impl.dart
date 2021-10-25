import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../instance/mastodon_api_instance_model_impl.dart';
import 'level/mastodon_api_access_level_model.dart';
import 'level/mastodon_api_access_level_model_impl.dart';
import 'mastodon_api_access_model.dart';
import 'token/application/mastodon_api_access_application_token_model_impl.dart';
import 'token/user/mastodon_api_access_user_token_model_impl.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_access_model_impl.freezed.dart';

part 'mastodon_api_access_model_impl.g.dart';

@freezed
@HiveType(typeId: 0)
class MastodonApiAccess with _$MastodonApiAccess implements IMastodonApiAccess {
  const MastodonApiAccess._();

  const factory MastodonApiAccess({
    @HiveField(0) required String url,
    @HiveField(1) required MastodonApiInstance? instance,
    @HiveField(4)
    @JsonKey(name: 'application_access_token')
        required MastodonApiAccessApplicationToken? applicationAccessToken,
    @HiveField(5)
    @JsonKey(name: 'user_access_token')
        required MastodonApiAccessUserToken? userAccessToken,
  }) = _MastodonApiAccess;

  factory MastodonApiAccess.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccessFromJson(json);

  @override
  IMastodonApiAccessLevel get level {
    IMastodonApiAccessLevel result;
    if (userAccessToken != null) {
      result = MastodonApiAccessLevel.user;
    } else if (applicationAccessToken != null) {
      result = MastodonApiAccessLevel.application;
    } else {
      result = MastodonApiAccessLevel.public;
    }

    return result;
  }
}

extension IMastodonApiAccessInterfaceExtension on IMastodonApiAccess {
  MastodonApiAccess toMastodonApiAccess({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccess(
          url: url,
          instance: instance?.toMastodonApiInstance(
            forceNewObject: forceNewObject,
          ),
          applicationAccessToken:
              applicationAccessToken?.toMastodonApiAccessApplicationToken(
            forceNewObject: forceNewObject,
          ),
          userAccessToken: userAccessToken?.toMastodonApiAccessUserToken(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
