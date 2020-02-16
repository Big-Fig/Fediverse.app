abstract class IMastodonEmoji {
  String get shortcode;

  String get url;
}

abstract class IMastodonEmojiReactions {
  String get name;

  int get count;

  bool get me;
}
