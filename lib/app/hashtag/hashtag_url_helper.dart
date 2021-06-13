class HashtagUrlHelper {
  static String calculateHashtagUrl({
    required bool isMastodon,
    required String urlSchema,
    required String urlHost,
    required String hashtag,
    required bool isPleroma,
  }) {
    if (isMastodon) {
      return '$urlSchema://$urlHost/tag/$hashtag';
    } else if (isPleroma) {
      return '$urlSchema://$urlHost/tags/$hashtag';
    } else {
      // TODO: implement createHashtagUrl
      throw UnimplementedError();
    }
  }
}
