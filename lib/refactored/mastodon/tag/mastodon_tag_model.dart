import 'package:fedi/refactored/mastodon/history/mastodon_history_model.dart';

abstract class IMastodonTag {
  String get name;

  String get url;

  List<IMastodonHistory> get history;
}

