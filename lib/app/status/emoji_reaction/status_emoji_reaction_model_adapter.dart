import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusEmojiReactionAdapter implements IEmojiReaction {
  final IUnifediApiEmojiReaction UnifediApiEmojiReaction;

  StatusEmojiReactionAdapter({
    required this.UnifediApiEmojiReaction,
  });

  @override
  int get count => UnifediApiEmojiReaction.count;

  @override
  bool get me => UnifediApiEmojiReaction.me;

  @override
  String get name => UnifediApiEmojiReaction.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusEmojiReactionAdapter &&
          runtimeType == other.runtimeType &&
          UnifediApiEmojiReaction == other.UnifediApiEmojiReaction;

  @override
  int get hashCode => UnifediApiEmojiReaction.hashCode;

  @override
  String toString() => 'StatusEmojiReactionAdapter{'
      'UnifediApiEmojiReaction: $UnifediApiEmojiReaction'
      '}';
}
