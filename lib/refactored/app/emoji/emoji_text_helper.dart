import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';

String addEmojiToHtmlContent(
    String content,
    List<IPleromaEmoji> emoji,
    ) {
  // todo: rework with RichText
  if (emoji?.isNotEmpty != true) {
    return "<html><body><p>$content</p></body></html>";
  }

  List<IPleromaEmoji> customEmoji = emoji ?? [];

  var newHtmlContent = content;
  for (int i = 0; i < customEmoji.length; i++) {
    var emoji = customEmoji[i];
    String shortcode = emoji.shortcode;
    String url = emoji.url;

    // todo: displays always on new line. should be inline
    newHtmlContent = newHtmlContent.replaceAll(
        ":$shortcode:", '<img src="$url" width="20">');
  }
  newHtmlContent = "<html><body><p>$newHtmlContent</p></body></html>";
//  newHtmlContent = "<p>$newHtmlContent</p>";
  return newHtmlContent;
}
