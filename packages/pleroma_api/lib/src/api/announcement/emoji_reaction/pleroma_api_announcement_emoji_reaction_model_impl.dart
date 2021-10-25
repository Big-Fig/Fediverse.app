import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_announcement_emoji_reaction_model.dart';

part 'pleroma_api_announcement_emoji_reaction_model_impl.freezed.dart';

part 'pleroma_api_announcement_emoji_reaction_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiAnnouncementEmojiReaction
    with _$PleromaApiAnnouncementEmojiReaction
    implements IPleromaApiAnnouncementEmojiReaction {
  const factory PleromaApiAnnouncementEmojiReaction({
    @HiveField(0) required String name,
    @HiveField(1) required int count,
    @HiveField(2) required bool me,
    @HiveField(3) required String? url,
    @HiveField(4) @JsonKey(name: 'static_url') required String? staticUrl,
  }) = _PleromaApiAnnouncementEmojiReaction;

  factory PleromaApiAnnouncementEmojiReaction.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAnnouncementEmojiReactionFromJson(json);
}

extension IPleromaApiAnnouncementEmojiReactionInterfaceExtension
    on IPleromaApiAnnouncementEmojiReaction {
  PleromaApiAnnouncementEmojiReaction toPleromaApiAnnouncementEmojiReaction({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiAnnouncementEmojiReaction(
          name: name,
          count: count,
          me: me,
          url: url,
          staticUrl: staticUrl,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiAnnouncementEmojiReactionInterfaceListExtension
    on List<IPleromaApiAnnouncementEmojiReaction> {
  List<PleromaApiAnnouncementEmojiReaction>
      toPleromaApiAnnouncementEmojiReactionList({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceListToImplList(
            this,
            (IPleromaApiAnnouncementEmojiReaction item) =>
                item.toPleromaApiAnnouncementEmojiReaction(),
            forceNewObject: forceNewObject,
          );
}
