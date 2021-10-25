import '../../mastodon_api_model.dart';

abstract class IMastodonApiPostFilter implements IMastodonApiObject {
  Duration? get expiresIn;

  String get phrase;

  List<String> get context;

  bool get irreversible;

  bool get wholeWord;
}
