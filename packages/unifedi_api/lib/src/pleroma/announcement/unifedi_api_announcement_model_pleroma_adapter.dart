import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/announcement/unifedi_api_announcement_model.dart';
import '../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../api/mention/unifedi_api_mention_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import '../mention/unifedi_api_mention_model_pleroma_adapter.dart';
import '../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../tag/unifedi_api_tag_model_pleroma_adapter.dart';
import 'emoji_reaction/unifedi_api_announcement_emoji_reaction_model_pleroma_adapter.dart';

part 'unifedi_api_announcement_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_announcement_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAnnouncementPleromaAdapter
    with _$UnifediApiAnnouncementPleromaAdapter
    implements IUnifediApiAnnouncement {
  const UnifediApiAnnouncementPleromaAdapter._();
  const factory UnifediApiAnnouncementPleromaAdapter(
    @HiveField(0) PleromaApiAnnouncement value,
  ) = _UnifediApiAnnouncementPleromaAdapter;

  @override
  List<IUnifediApiMention>? get mentions =>
      value.mentions?.toUnifediApiMentionPleromaAdapterList();

  @override
  List<IUnifediApiEmojiReaction>? get reactions => value.reactions
      ?.toUnifediApiAnnouncementEmojiReactionPleromaAdapterList();

  @override
  List<IUnifediApiStatus>? get statuses =>
      value.statuses?.toUnifediApiStatusPleromaAdapterList();

  @override
  List<IUnifediApiTag>? get tags =>
      value.tags?.toUnifediApiTagPleromaAdapterList();

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
  factory UnifediApiAnnouncementPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAnnouncementPleromaAdapterFromJson(json);
}

extension PleromaApiAnnouncementUnifediExtension on IPleromaApiAnnouncement {
  UnifediApiAnnouncementPleromaAdapter
      toUnifediApiAnnouncementPleromaAdapter() =>
          UnifediApiAnnouncementPleromaAdapter(
            toPleromaApiAnnouncement(),
          );
}

extension PleromaApiAnnouncementUnifediListExtension
    on List<IPleromaApiAnnouncement> {
  List<UnifediApiAnnouncementPleromaAdapter>
      toUnifediApiAnnouncementPleromaAdapterList() => map(
            (item) => item.toUnifediApiAnnouncementPleromaAdapter(),
          ).toList();
}
