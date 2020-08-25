import 'package:fedi/mastodon/status/mastodon_status_model.dart';

abstract class IMastodonStatusContext {
  List<IMastodonStatus> get descendants;

  List<IMastodonStatus> get ancestors;
}
