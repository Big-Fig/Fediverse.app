import 'package:collection/collection.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:flutter/widgets.dart';

Function eq = const ListEquality().equals;

class EmojiText {
  final String text;
  final List<IPleromaEmoji> emojis;
  EmojiText({@required this.text, @required this.emojis});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmojiText &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          eq(emojis, other.emojis);
  @override
  int get hashCode => text.hashCode ^ emojis.hashCode;
  @override
  String toString() {
    return 'EmojiText{text: $text, emojis: $emojis}';
  }
}
