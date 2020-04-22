import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmojiTextWidget extends StatelessWidget {
  final EmojiText emojiText;
  EmojiTextWidget({@required this.emojiText});

  @override
  Widget build(BuildContext context) {
    if (emojiText.emojis?.isNotEmpty == true) {
      return buildEmojifiedText(context);
    } else {
      return Text(
        emojiText.text,
        style: TextStyle(fontSize: 17.0),
      );
    }
  }

  Row buildEmojifiedText(BuildContext context) {
    var emojiUsername = emojiText.text.split(":");
    List<Widget> usernameWidget = [];

    for (var i = 0; i < emojiUsername.length; i++) {
      var emojiOrText = emojiUsername[i];
      var foundEmoji = false;
      for (var j = 0; j < emojiText.emojis.length; j++) {
        var emoji = emojiText.emojis[j];
        String shortcode = emoji.shortcode;
        String url = emoji.url;
        if (shortcode == emojiOrText) {
          var image = CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) {
              return Icon(Icons.help_outline);
//              return SizedBox.shrink();
            },
            height: 15,
            width: 15,
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
          usernameWidget.add(image);
          foundEmoji = true;
        }
      }

      if (foundEmoji == false) {
        var text = Text(
          emojiOrText,
          style: TextStyle(fontSize: 17.0),
        );
        usernameWidget.add(text);
      }
    }
    return Row(children: usernameWidget);
  }
}
