import 'package:fedi/mastodon/api/history/mastodon_history_model.dart';

abstract class IMastodonTag {
  String get name;

  String get url;

  List<IMastodonTagHistory>? get history;
}
