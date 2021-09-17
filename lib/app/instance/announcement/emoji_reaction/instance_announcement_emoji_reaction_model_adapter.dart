import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceAnnouncementEmojiReactionAdapter implements IEmojiReaction {
  final IUnifediApiEmojiReaction unifediApiEmojiReaction;

  InstanceAnnouncementEmojiReactionAdapter({
    required this.unifediApiEmojiReaction,
  });

  @override
  int get count => unifediApiEmojiReaction.count;

  @override
  bool get me => unifediApiEmojiReaction.me;

  @override
  String get name => unifediApiEmojiReaction.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceAnnouncementEmojiReactionAdapter &&
          runtimeType == other.runtimeType &&
          unifediApiEmojiReaction ==
              other.unifediApiEmojiReaction;

  @override
  int get hashCode => unifediApiEmojiReaction.hashCode;

  @override
  String toString() => 'InstanceAnnouncementEmojiReactionAdapter{'
      'unifediApiEmojiReaction: $unifediApiEmojiReaction'
      '}';
}
