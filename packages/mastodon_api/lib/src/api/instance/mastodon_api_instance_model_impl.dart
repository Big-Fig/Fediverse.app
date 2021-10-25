import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/mastodon_api_account_model_impl.dart';
import 'mastodon_api_instance_model.dart';
import 'stats/mastodon_api_instance_stats_model_impl.dart';
import 'urls/mastodon_api_instance_urls_model_impl.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_instance_model_impl.freezed.dart';

part 'mastodon_api_instance_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiInstance
    with _$MastodonApiInstance
    implements IMastodonApiInstance {
  const factory MastodonApiInstance({
    @HiveField(0) required String uri,
    @HiveField(1) required String? title,
    @JsonKey(name: 'short_description')
    @HiveField(2)
        required String? shortDescription,
    @HiveField(3) required String? description,
    @HiveField(4) required String? email,
    @JsonKey(name: 'version') @HiveField(5) required String versionString,
    @HiveField(6) required MastodonApiInstanceUrls? urls,
    @HiveField(7) required MastodonApiInstanceStats? stats,
    @HiveField(8) required String? thumbnail,
    @HiveField(9) required List<String>? languages,
    @HiveField(10) required bool? registrations,
    @HiveField(11) required bool? approvalRequired,
    @HiveField(12) required bool? invitesEnabled,
    @JsonKey(name: 'contact_account')
    @HiveField(13)
        required MastodonApiAccount? contactAccount,
  }) = _MastodonApiInstance;

  factory MastodonApiInstance.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiInstanceFromJson(json);
}

extension MastodonApiInstanceInterfaceExtension on IMastodonApiInstance {
  MastodonApiInstance toMastodonApiInstance({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiInstance(
          approvalRequired: approvalRequired,
          contactAccount: contactAccount?.toMastodonApiAccount(
            forceNewObject: forceNewObject,
          ),
          email: email,
          languages: languages,
          registrations: registrations,
          shortDescription: shortDescription,
          stats: stats?.toMastodonApiInstanceStats(),
          thumbnail: thumbnail,
          title: title,
          uri: uri,
          urls: urls?.toMastodonApiInstanceUrls(),
          description: description,
          invitesEnabled: invitesEnabled,
          versionString: versionString,
        ),
        forceNewObject: forceNewObject,
      );
}
