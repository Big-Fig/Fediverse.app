import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
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

  IUnifediApiPoll get poll;

  Stream<IUnifediApiPoll> get pollStream;

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

  void onPollOptionSelected(IUnifediApiPollOption pollOption);

  List<IUnifediApiPollOption> get selectedVotes;

  Stream<List<IUnifediApiPollOption>> get selectedVotesStream;

  bool get isVoted;

  Stream<bool> get isVotedStream;

  Future vote();

  void onPollUpdated(IUnifediApiPoll? poll);

  Future refreshFromNetwork();

  void showResultsWithoutVote();

  void hideResultsWithoutVote();
}
