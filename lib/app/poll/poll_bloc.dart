import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPollBloc implements IDisposable {
  static IPollBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPollBloc>(
        context,
        listen: listen,
      );

  IPleromaApiPoll get poll;

  Stream<IPleromaApiPoll> get pollStream;

  bool get isNeedShowResultsWithoutVote;

  Stream<bool> get isNeedShowResultsWithoutVoteStream;

  bool get isPossibleToVote;

  Stream<bool> get isPossibleToVoteStream;

  DateTime? get expiresAt;

  bool get expired;

  bool get multiple;

  int? get votesCount;

  Stream<int?> get votesCountStream;

  int? get votersCount;

  Stream<int?> get votersCountStream;

  void onPollOptionSelected(IPleromaApiPollOption pollOption);

  List<IPleromaApiPollOption> get selectedVotes;

  Stream<List<IPleromaApiPollOption>> get selectedVotesStream;

  bool get isVoted;

  Stream<bool> get isVotedStream;

  Future vote();

  void onPollUpdated(IPleromaApiPoll? poll);

  Future refreshFromNetwork();

  void showResultsWithoutVote();

  void hideResultsWithoutVote();
}
