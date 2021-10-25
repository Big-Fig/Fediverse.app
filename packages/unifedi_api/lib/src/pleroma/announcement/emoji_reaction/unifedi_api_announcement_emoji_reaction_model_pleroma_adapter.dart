import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';

part 'unifedi_api_announcement_emoji_reaction_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_announcement_emoji_reaction_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAnnouncementEmojiReactionPleromaAdapter
    with _$UnifediApiAnnouncementEmojiReactionPleromaAdapter
    implements IUnifediApiEmojiReaction {
  const UnifediApiAnnouncementEmojiReactionPleromaAdapter._();
  const factory UnifediApiAnnouncementEmojiReactionPleromaAdapter(
    @HiveField(0) PleromaApiAnnouncementEmojiReaction value,
  ) = _UnifediApiAnnouncementEmojiReactionPleromaAdapter;

  @override
  List<IUnifediApiAccount>? get accounts => null;

  @override
  int get count => value.count;

  @override
  bool get me => value.me;

  @override
  String get name => value.name;

  @override
  String? get staticUrl => value.staticUrl;

  @override
  String? get url => value.url;
  factory UnifediApiAnnouncementEmojiReactionPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAnnouncementEmojiReactionPleromaAdapterFromJson(json);
}

extension PleromaApiAnnouncementEmojiReactionUnifediExtension
    on IPleromaApiAnnouncementEmojiReaction {
  UnifediApiAnnouncementEmojiReactionPleromaAdapter
      toUnifediApiAnnouncementEmojiReactionPleromaAdapter() =>
          UnifediApiAnnouncementEmojiReactionPleromaAdapter(
            toPleromaApiAnnouncementEmojiReaction(),
          );
}

extension PleromaApiAnnouncementEmojiReactionUnifediListExtension
    on List<IPleromaApiAnnouncementEmojiReaction> {
  List<UnifediApiAnnouncementEmojiReactionPleromaAdapter>
      toUnifediApiAnnouncementEmojiReactionPleromaAdapterList() => map(
            (item) =>
                item.toUnifediApiAnnouncementEmojiReactionPleromaAdapter(),
          ).toList();
}
