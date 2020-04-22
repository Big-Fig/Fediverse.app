import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef EmojiReactionSelectedCallback(String emojiName, String emoji);

class StatusEmojiReactionPickerWidget extends StatelessWidget {
  final EmojiReactionSelectedCallback emojiReactionSelectedCallback;

  StatusEmojiReactionPickerWidget(
      {@required this.emojiReactionSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      bgColor: Colors.transparent,
      rows: 5,
      columns: 7,
      numRecommended: 0,
      selectedCategory: Category.RECENT,
      recommendKeywords: null,
      buttonMode: ButtonMode.MATERIAL,
      onEmojiSelected: (emoji, category) {
        SharedPreferences.getInstance().then((prefs) {
          final key = "recents";
          var recentEmojis = prefs.getStringList(key) ?? new List();
          recentEmojis.insert(0, emoji.name);
          prefs.setStringList(key, recentEmojis);
        });

        emojiReactionSelectedCallback(emoji.name, emoji.emoji);
      },
    );
  }
}
