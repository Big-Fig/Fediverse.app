import 'package:fedi_app/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'status_emoji_reaction_model_adapter.freezed.dart';

@freezed
class StatusEmojiReactionAdapter
    with _$StatusEmojiReactionAdapter
    implements IEmojiReaction {
  const StatusEmojiReactionAdapter._();
  const factory StatusEmojiReactionAdapter({
    required IUnifediApiEmojiReaction unifediApiEmojiReaction,
  }) = _StatusEmojiReactionAdapter;

  @override
  int get count => unifediApiEmojiReaction.count;

  @override
  bool get me => unifediApiEmojiReaction.me;

  @override
  String get name => unifediApiEmojiReaction.name;
}
