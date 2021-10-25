import '../mastodon_api_model.dart';
import 'option/mastodon_api_poll_option_model.dart';

abstract class IMastodonApiPoll implements IMastodonApiResponse {
  String? get id;

  DateTime? get expiresAt;

  bool get expired;

  bool get multiple;

  int? get votesCount;

  int? get votersCount;

  bool? get voted;

  List<int>? get ownVotes;

  List<IMastodonApiPollOption> get options;
}

extension IMastodonApiPollExtension on IMastodonApiPoll {
  bool get isPossibleToVote => !expired && voted == false;
}
