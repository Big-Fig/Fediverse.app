import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_application_model.dart';

part 'mastodon_api_application_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_application_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiApplication
    with _$MastodonApiApplication
    implements IMastodonApiApplication {
  const factory MastodonApiApplication({
    @HiveField(3) required String? name,
    @HiveField(4) required String? website,
    @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey,
  }) = _MastodonApiApplication;

  factory MastodonApiApplication.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiApplicationFromJson(json);
}

extension IMastodonApiApplicationInterfaceExtension on IMastodonApiApplication {
  MastodonApiApplication toMastodonApiApplication({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiApplication(
          name: name,
          website: website,
          vapidKey: vapidKey,
        ),
        forceNewObject: forceNewObject,
      );
}
