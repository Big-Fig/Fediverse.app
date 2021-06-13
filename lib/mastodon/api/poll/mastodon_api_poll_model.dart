abstract class IMastodonApiPoll {
  String? get id;

  DateTime? get expiresAt;

  bool get expired;

  bool get multiple;

  int? get votesCount;

  int? get votersCount;

  bool? get voted;

  List<int>? get ownVotes;

  List<IMastodonPollOption> get options;
}

extension IMastodonPollExtension on IMastodonApiPoll {
  bool get isPossibleToVote => !expired && voted == false;
}

abstract class IMastodonPollOption {
  String get title;

  int? get votesCount;
}
