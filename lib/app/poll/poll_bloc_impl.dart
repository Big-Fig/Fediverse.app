import 'dart:async';

import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/api/poll/mastodon_api_poll_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service.dart';
import 'package:rxdart/rxdart.dart';

class PollBloc extends DisposableOwner implements IPollBloc {
  final BehaviorSubject<IPleromaApiPoll> pollSubject;

  BehaviorSubject<bool> isNeedShowResultsWithoutVoteSubject =
      BehaviorSubject.seeded(false);

  @override
  bool get isNeedShowResultsWithoutVote =>
      isNeedShowResultsWithoutVoteSubject.value!;

  @override
  Stream<bool> get isNeedShowResultsWithoutVoteStream =>
      isNeedShowResultsWithoutVoteSubject.stream;

  final BehaviorSubject<List<IPleromaApiPollOption>> selectedVotesSubject =
      BehaviorSubject.seeded([]);

  final IPleromaApiPollService? pleromaPollService;

  final InstanceLocation instanceLocation;

  PollBloc({
    required IPleromaApiPoll poll,
    required this.pleromaPollService,
    required this.instanceLocation,
  }) : pollSubject = BehaviorSubject.seeded(poll) {
    addDisposable(subject: pollSubject);
    addDisposable(subject: selectedVotesSubject);
    addDisposable(subject: isNeedShowResultsWithoutVoteSubject);

    if (!poll.expired && poll.expiresAt != null) {
      var diff = DateTime.now()
          .difference(
            poll.expiresAt!,
          )
          .abs();

      addDisposable(
        timer: Timer(
          diff,
          () {
            refreshFromNetwork();
          },
        ),
      );
    }
  }

  bool get isLocalInstanceLocation =>
      instanceLocation == InstanceLocation.local;

  @override
  IPleromaApiPoll get poll => pollSubject.value!;

  @override
  Stream<IPleromaApiPoll> get pollStream => pollSubject.stream;

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
  Stream<int?> get votesCountStream => pollStream.map((poll) => poll.votesCount);

  @override
  int? get votersCount => poll.votersCount;

  @override
  Stream<int?> get votersCountStream => pollStream.map(
        (poll) => poll.votersCount,
      );

  @override
  void onPollOptionSelected(IPleromaApiPollOption pollOption) {
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

    var updatedPoll = await pleromaPollService!.vote(
      pollRemoteId: poll.id!,
      voteIndexes: voteIndexes,
    );

    pollSubject.add(updatedPoll);

    selectedVotes.clear();
  }

  @override
  List<IPleromaApiPollOption> get selectedVotes => selectedVotesSubject.value!;

  @override
  Stream<List<IPleromaApiPollOption>> get selectedVotesStream =>
      selectedVotesSubject.stream;

  @override
  bool get isVoted => selectedVotes.isNotEmpty;

  @override
  Stream<bool> get isVotedStream => selectedVotesStream.map(
        (selectedVotes) => selectedVotes.isNotEmpty,
      );

  @override
  void onPollUpdated(IPleromaApiPoll? poll) {
    // TODO: WTF?
    pollSubject.add(poll!);
  }

  @override
  Future refreshFromNetwork() async {
    var remotePoll = await pleromaPollService!.getPoll(
      pollRemoteId: poll.id!,
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
