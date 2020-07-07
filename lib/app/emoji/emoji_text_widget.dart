import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/emoji/emoji_text_model.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmojiTextWidget extends StatelessWidget {
  final EmojiText emojiText;
  final TextStyle textStyle;
  final TextOverflow textOverflow;
  final double emojiSize;
  final TextAlign textAlign;

  const EmojiTextWidget({
    @required this.emojiText,
    this.emojiSize = 19.0,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    if (emojiText.emojis?.isNotEmpty == true) {
      return buildEmojifiedText(context);
    } else {
      return Text(
        emojiText.text,
        style: textStyle,
        textAlign: textAlign,
        overflow: textOverflow,
      );
    }
  }

  Widget buildEmojifiedText(BuildContext context) {
    var emojiUsername = emojiText.text.split(":");
    List<InlineSpan> spans = [];

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
              return Icon(
                FediIcons.image,
                size: textStyle.fontSize,
                color: textStyle.color,
              );
//              return SizedBox.shrink();
            },
            height: emojiSize,
            width: emojiSize,
            errorWidget: (context, url, error) => Icon(
              FediIcons.warning,
              color: FediColors.error,
              size: textStyle.fontSize,
            ),
          );
          spans.add(WidgetSpan(child: image));
          foundEmoji = true;
        }
      }

      if (foundEmoji == false) {
        spans.add(TextSpan(
          text: emojiOrText,
          style: textStyle,
        ));
      }
    }

    return RichText(
      overflow: textOverflow,
      textAlign: textAlign,
      text: TextSpan(
        children: spans,
      ),
    );
  }
}
