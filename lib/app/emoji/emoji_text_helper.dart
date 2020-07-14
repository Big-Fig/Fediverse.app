import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';

String addEmojiToHtmlContent(String content, List<IPleromaEmoji> emoji,
    {bool isNeedToddHtmlBodyWrapper = true}) {
  if (content == null) {
    return null;
  }

  if (content.trim().isEmpty) {
    return "";
  }

  if (emoji?.isNotEmpty != true && isNeedToddHtmlBodyWrapper) {
    return _addHtmlBodyWrapper(content);
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
  if (isNeedToddHtmlBodyWrapper) {
    newHtmlContent = _addHtmlBodyWrapper(newHtmlContent);
  }
  return newHtmlContent;
}

String _addHtmlBodyWrapper(String content) =>
    "<html><body><p>$content</p></body></html>";
