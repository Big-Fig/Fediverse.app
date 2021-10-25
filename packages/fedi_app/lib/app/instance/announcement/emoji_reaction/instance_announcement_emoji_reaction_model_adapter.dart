import 'package:fedi_app/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'instance_announcement_emoji_reaction_model_adapter.freezed.dart';

@freezed
class InstanceAnnouncementEmojiReactionAdapter
    with _$InstanceAnnouncementEmojiReactionAdapter
    implements IEmojiReaction {
  const InstanceAnnouncementEmojiReactionAdapter._();
  const factory InstanceAnnouncementEmojiReactionAdapter({
    required IUnifediApiEmojiReaction unifediApiEmojiReaction,
  }) = _InstanceAnnouncementEmojiReactionAdapter;

  @override
  int get count => unifediApiEmojiReaction.count;

  @override
  bool get me => unifediApiEmojiReaction.me;

  @override
  String get name => unifediApiEmojiReaction.name;
}
