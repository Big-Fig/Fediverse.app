import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_model.dart';
import 'option/pleroma_api_poll_option_model.dart';

// ignore_for_file: no-magic-number

abstract class IPleromaApiPoll
    implements IMastodonApiPoll, IPleromaApiResponse {
  @override
  List<IPleromaApiPollOption> get options;
}

extension IPleromaApiPollVoteExtension on IPleromaApiPoll {
  bool isOwnVote(IPleromaApiPollOption option) {
    var index = options.indexOf(option);

    var myVotes = ownVotes;
    var voted = myVotes != null && myVotes.contains(index);

    return voted;
  }

  double votesPercent(IPleromaApiPollOption option) {
    // votes count can be hidden until poll ends
    var votesCount = option.votesCount;

    var pollVotesCount = this.votesCount;

    return votesCount == 0 || votesCount == null || pollVotesCount == null
        ? 0.0
        : votesCount / pollVotesCount;
  }
}
