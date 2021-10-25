abstract class IMastodonApiPostStatusPoll {
  /// Array of possible answers. If provided, media_ids cannot be used, and
  /// poll.expires_in must be provided.
  List<String> get options;

  /// Duration the poll should be open, in seconds. If provided, media_ids
  /// cannot be used, and poll[options] must be provided.
  int get expiresInSeconds;

  ///   Allow multiple choices?
  bool get multiple;

  ///   Hide vote counts until the poll ends?
  bool get hideTotals;
}
