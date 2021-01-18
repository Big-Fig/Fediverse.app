abstract class IMastodonPoll {
  String get id;

  DateTime get expiresAt;

  bool get expired;

  bool get multiple;

  int get votesCount;

  int get votersCount;

  bool get voted;

  List<int> get ownVotes;

  List<IMastodonPollOption> get options;
}

extension IMastodonPollExtension on IMastodonPoll {
  bool get isPossibleToVote => expired != true && voted != true;
}

abstract class IMastodonPollOption {
  String get title;

  int get votesCount;
}
