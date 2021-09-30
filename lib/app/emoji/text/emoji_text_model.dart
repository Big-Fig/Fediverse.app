import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EmojiText {
  final String text;
  final List<IUnifediApiEmoji>? emojis;

  EmojiText({
    required this.text,
    required this.emojis,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmojiText &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          listEquals(emojis, other.emojis);

  @override
  int get hashCode => text.hashCode ^ listHash(emojis);

  @override
  String toString() => 'EmojiText{'
      'text: $text, '
      'emojis: $emojis'
      '}';
}
