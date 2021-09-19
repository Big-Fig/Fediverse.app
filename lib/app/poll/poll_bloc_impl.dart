import 'dart:async';

import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';

import 'package:unifedi_api/unifedi_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';

class PollBloc extends DisposableOwner implements IPollBloc {
  final BehaviorSubject<IUnifediApiPoll> pollSubject;

  BehaviorSubject<bool> isNeedShowResultsWithoutVoteSubject =
      BehaviorSubject.seeded(false);

  @override
  bool get isNeedShowResultsWithoutVote =>
      isNeedShowResultsWithoutVoteSubject.value;

  @override
  Stream<bool> get isNeedShowResultsWithoutVoteStream =>
      isNeedShowResultsWithoutVoteSubject.stream;

  final BehaviorSubject<List<IUnifediApiPollOption>> selectedVotesSubject =
      BehaviorSubject.seeded([]);

  final IUnifediApiPollService? unifediApiPollService;

  final InstanceLocation instanceLocation;

  PollBloc({
    required IUnifediApiPoll poll,
    required this.unifediApiPollService,
    required this.instanceLocation,
  }) : pollSubject = BehaviorSubject.seeded(poll) {
    pollSubject.disposeWith(this);
    selectedVotesSubject.disposeWith(this);
    isNeedShowResultsWithoutVoteSubject.disposeWith(this);

    if (!poll.expired && poll.expiresAt != null) {
      var diff = DateTime.now()
          .difference(
            poll.expiresAt!,
          )
          .abs();

      Timer(
        diff,
        () {
          refreshFromNetwork();
        },
      ).disposeWith(this);
    }
  }

  bool get isLocalInstanceLocation =>
      instanceLocation == InstanceLocation.local;

  @override
  IUnifediApiPoll get poll => pollSubject.value;

  @override
  Stream<IUnifediApiPoll> get pollStream => pollSubject.stream;

  @override
  bool get isPossibleToVote => isLocalInstanceLocation && poll.isPossibleToVote;

  @override
  Stream<bool> get isPossibleToVoteStream => pollStream.map(
        (poll) => isLocalInstanceLocation && poll.isPossibleToVote,
      );

  @override
  DateTime? get expiresAt => poll.expiresAt;

  @override
  bool get expired => poll.expired;

  @override
  bool get multiple => poll.multiple;

  @override
  int? get votesCount => poll.votesCount;

  @override
  Stream<int?> get votesCountStream =>
      pollStream.map((poll) => poll.votesCount);

  @override
  int? get votersCount => poll.votersCount;

  @override
  Stream<int?> get votersCountStream => pollStream.map(
        (poll) => poll.votersCount,
      );

  @override
  void onPollOptionSelected(IUnifediApiPollOption pollOption) {
    if (!multiple) {
      selectedVotes.clear();
    }

    if (selectedVotes.contains(pollOption)) {
      selectedVotes.remove(pollOption);
    } else {
      selectedVotes.add(pollOption);
    }
    selectedVotesSubject.add(selectedVotes);
  }

  @override
  Future vote() async {
    assert(selectedVotes.isNotEmpty);
    var voteIndexes = <int>[];

    selectedVotes.forEach((selectedVote) {
      var option = poll.options
          .firstWhere((option) => option.title == selectedVote.title);
      var index = poll.options.indexOf(option);
      voteIndexes.add(index);
    });

    var updatedPoll = await unifediApiPollService!.vote(
      pollId: poll.id!,
      voteIndexes: voteIndexes,
    );

    pollSubject.add(updatedPoll);

    selectedVotes.clear();
  }

  @override
  List<IUnifediApiPollOption> get selectedVotes => selectedVotesSubject.value;

  @override
  Stream<List<IUnifediApiPollOption>> get selectedVotesStream =>
      selectedVotesSubject.stream;

  @override
  bool get isVoted => selectedVotes.isNotEmpty;

  @override
  Stream<bool> get isVotedStream => selectedVotesStream.map(
        (selectedVotes) => selectedVotes.isNotEmpty,
      );

  @override
  void onPollUpdated(IUnifediApiPoll? poll) {
    // TODO: WTF?
    pollSubject.add(poll!);
  }

  @override
  Future refreshFromNetwork() async {
    var remotePoll = await unifediApiPollService!.getPoll(
      pollId: poll.id!,
    );

    pollSubject.add(remotePoll);
  }

  @override
  void showResultsWithoutVote() {
    isNeedShowResultsWithoutVoteSubject.add(true);
  }

  @override
  void hideResultsWithoutVote() {
    isNeedShowResultsWithoutVoteSubject.add(false);
  }
}
