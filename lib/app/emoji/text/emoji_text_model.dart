import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'emoji_text_model.freezed.dart';

@freezed
class EmojiText with _$EmojiText {
  const factory EmojiText({
    required String text,
    required List<IUnifediApiEmoji>? emojis,
  }) = _EmojiText;
}
