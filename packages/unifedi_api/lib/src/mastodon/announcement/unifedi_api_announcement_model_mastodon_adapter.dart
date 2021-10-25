import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/announcement/unifedi_api_announcement_model.dart';
import '../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../api/mention/unifedi_api_mention_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import '../mention/unifedi_api_mention_model_mastodon_adapter.dart';
import '../status/unifedi_api_status_model_mastodon_adapter.dart';
import '../tag/unifedi_api_tag_model_mastodon_adapter.dart';
import 'emoji_reaction/unifedi_api_announcement_emoji_reaction_model_mastodon_adapter.dart';

part 'unifedi_api_announcement_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_announcement_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAnnouncementMastodonAdapter
    with _$UnifediApiAnnouncementMastodonAdapter
    implements IUnifediApiAnnouncement {
  const UnifediApiAnnouncementMastodonAdapter._();

  const factory UnifediApiAnnouncementMastodonAdapter(
    @HiveField(0) MastodonApiAnnouncement value,
  ) = _UnifediApiAnnouncementMastodonAdapter;

  @override
  List<IUnifediApiMention>? get mentions =>
      value.mentions?.toUnifediApiMentionMastodonAdapterList();

  @override
  List<IUnifediApiEmojiReaction>? get reactions => value.reactions
      ?.toUnifediApiAnnouncementEmojiReactionMastodonAdapterList();

  @override
  List<IUnifediApiStatus>? get statuses =>
      value.statuses?.toUnifediApiStatusMastodonAdapterList();

  @override
  List<IUnifediApiTag>? get tags =>
      value.tags?.toUnifediApiTagMastodonAdapterList();

  @override
  bool get allDay => value.allDay;

  @override
  String get content => value.content;

  @override
  DateTime? get endsAt => value.endsAt;

  @override
  String get id => value.id;

  @override
  DateTime get publishedAt => value.publishedAt;

  @override
  bool? get read => value.read;

  @override
  DateTime? get scheduledAt => value.scheduledAt;

  @override
  DateTime? get startsAt => value.startsAt;

  @override
  DateTime get updatedAt => value.updatedAt;
  factory UnifediApiAnnouncementMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAnnouncementMastodonAdapterFromJson(json);
}

extension MastodonApiAnnouncementUnifediExtension on IMastodonApiAnnouncement {
  UnifediApiAnnouncementMastodonAdapter
      toUnifediApiAnnouncementMastodonAdapter() =>
          UnifediApiAnnouncementMastodonAdapter(
            toMastodonApiAnnouncement(),
          );
}

extension MastodonApiAnnouncementUnifediListExtension
    on List<IMastodonApiAnnouncement> {
  List<UnifediApiAnnouncementMastodonAdapter>
      toUnifediApiAnnouncementMastodonAdapterList() => map(
            (item) => item.toUnifediApiAnnouncementMastodonAdapter(),
          ).toList();
}
