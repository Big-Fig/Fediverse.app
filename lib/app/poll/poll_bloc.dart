import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPollBloc implements Disposable {
  static IPollBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPollBloc>(context, listen: listen);

  IPleromaPoll get poll;

  Stream<IPleromaPoll> get pollStream;

  bool get isNeedShowResultsWithoutVote;

  Stream<bool> get isNeedShowResultsWithoutVoteStream;

  bool get isPossibleToVote;

  Stream<bool> get isPossibleToVoteStream;

  DateTime get expiresAt;

  bool get expired;

  bool get multiple;

  int get votesCount;

  Stream<int> get votesCountStream;

  int get votersCount;

  Stream<int> get votersCountStream;

  void onPollOptionSelected(IPleromaPollOption pollOption);

  List<IPleromaPollOption> get selectedVotes;

  Stream<List<IPleromaPollOption>> get selectedVotesStream;

  bool get isVoted;

  Stream<bool> get isVotedStream;

  Future vote();

  void onPollUpdated(IPleromaPoll poll);

  Future<bool> refreshFromNetwork();

  void showResultsWithoutVote();

  void hideResultsWithoutVote();
}
