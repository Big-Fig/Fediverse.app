import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';

class StatusEmojiReactionAdapter implements IEmojiReaction {
  final IPleromaApiStatusEmojiReaction pleromaApiStatusEmojiReaction;

  StatusEmojiReactionAdapter({
    required this.pleromaApiStatusEmojiReaction,
  });

  @override
  int get count => pleromaApiStatusEmojiReaction.count;

  @override
  bool get me => pleromaApiStatusEmojiReaction.me;

  @override
  String get name => pleromaApiStatusEmojiReaction.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusEmojiReactionAdapter &&
          runtimeType == other.runtimeType &&
          pleromaApiStatusEmojiReaction == other.pleromaApiStatusEmojiReaction;

  @override
  int get hashCode => pleromaApiStatusEmojiReaction.hashCode;

  @override
  String toString() => 'StatusEmojiReactionAdapter{'
      'pleromaApiStatusEmojiReaction: $pleromaApiStatusEmojiReaction'
      '}';
}
