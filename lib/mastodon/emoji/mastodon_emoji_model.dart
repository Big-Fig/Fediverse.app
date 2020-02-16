abstract class IMastodonEmoji {
  String get shortcode;

  String get url;

  String get staticUrl;

  bool get visibleInPicker;
  String get category;
}

abstract class IMastodonEmojiReactions {
  String get name;

  int get count;

  bool get me;
}
