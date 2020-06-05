import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';

String addEmojiToHtmlContent(
  String content,
  List<IPleromaEmoji> emoji,
) {
  if (content == null) {
    return null;
  }

  if (content.trim().isEmpty) {
    return "";
  }

  if (emoji?.isNotEmpty != true) {
    return "<html><body><p>$content</p></body></html>";
  }

  List<IPleromaEmoji> customEmoji = emoji ?? [];

  var newHtmlContent = content;
  for (int i = 0; i < customEmoji.length; i++) {
    var emoji = customEmoji[i];
    String shortcode = emoji.shortcode;
    String url = emoji.url;

    newHtmlContent = newHtmlContent.replaceAll(
        ":$shortcode:", '<img src="$url" width="20">');
  }
  newHtmlContent = "<html><body><p>$newHtmlContent</p></body></html>";
//  newHtmlContent = "<p>$newHtmlContent</p>";
  return newHtmlContent;
}
