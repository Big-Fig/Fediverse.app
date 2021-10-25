import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_mention_model.dart';

part 'mastodon_api_mention_model_impl.freezed.dart';

part 'mastodon_api_mention_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiMention
    with _$MastodonApiMention
    implements IMastodonApiMention {
  const factory MastodonApiMention({
    @HiveField(0) required String acct,
    @HiveField(1) required String id,
    @HiveField(2) required String url,
    @HiveField(3) required String? username,
  }) = _MastodonApiMention;

  factory MastodonApiMention.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiMentionFromJson(json);
}

extension IMastodonApiMentionInterfaceExtension on IMastodonApiMention {
  MastodonApiMention toMastodonApiMention({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMention(
          acct: acct,
          id: id,
          url: url,
          username: username,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiMentionInterfaceListExtension
    on List<IMastodonApiMention> {
  List<MastodonApiMention> toMastodonApiMentionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiMention item) => item.toMastodonApiMention(),
        forceNewObject: forceNewObject,
      );

  List<String> toAccts() => map(
        (mastodonApiMention) => mastodonApiMention.acct,
      ).toList();
}
