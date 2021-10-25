import '../unifedi_api_model.dart';
import 'option/unifedi_api_poll_option_model.dart';

// ignore_for_file: no-magic-number

abstract class IUnifediApiPoll implements IUnifediApiResponse {
  String? get id;

  DateTime? get expiresAt;

  bool get expired;

  bool get multiple;

  int? get votesCount;

  int? get votersCount;

  bool? get voted;

  List<int>? get ownVotes;

  List<IUnifediApiPollOption> get options;
}

extension IUnifediPollExtension on IUnifediApiPoll {
  bool get isPossibleToVote => !expired && voted == false;

  bool isOwnVote(IUnifediApiPollOption option) {
    var index = options.indexOf(option);

    var myVotes = ownVotes;
    var voted = myVotes != null && myVotes.contains(index);

    return voted;
  }

  double votesPercent(IUnifediApiPollOption option) {
    // votes count can be hidden until poll ends
    var votesCount = option.votesCount;

    var pollVotesCount = this.votesCount;

    return votesCount == 0 || votesCount == null || pollVotesCount == null
        ? 0.0
        : votesCount / pollVotesCount;
  }
}
