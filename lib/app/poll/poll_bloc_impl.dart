import 'dart:async';

import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/poll/mastodon_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_service.dart';
import 'package:fedi/stream/stream_extension.dart';
import 'package:rxdart/rxdart.dart';

class PollBloc extends DisposableOwner implements IPollBloc {
  final BehaviorSubject<IPleromaPoll> pollSubject;

  BehaviorSubject<bool> isNeedShowResultsWithoutVoteSubject =
      BehaviorSubject.seeded(false);

  @override
  bool get isNeedShowResultsWithoutVote =>
      isNeedShowResultsWithoutVoteSubject.value!;

  @override
  Stream<bool> get isNeedShowResultsWithoutVoteStream =>
      isNeedShowResultsWithoutVoteSubject.stream;

  final BehaviorSubject<List<IPleromaPollOption>> selectedVotesSubject =
      BehaviorSubject.seeded([]);

  final IPleromaPollService? pleromaPollService;

  final InstanceLocation instanceLocation;

  PollBloc({
    required IPleromaPoll poll,
    required this.pleromaPollService,
    required this.instanceLocation,
  }) : pollSubject = BehaviorSubject.seeded(poll) {
    addDisposable(subject: pollSubject);
    addDisposable(subject: selectedVotesSubject);
    addDisposable(subject: isNeedShowResultsWithoutVoteSubject);

    if (!poll.expired) {
      var diff = DateTime.now()
          .difference(
            poll.expiresAt,
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
  IPleromaPoll get poll => pollSubject.value!;

  @override
  Stream<IPleromaPoll> get pollStream => pollSubject.stream;

  @override
  bool get isPossibleToVote => isLocalInstanceLocation && poll.isPossibleToVote;

  @override
  Stream<bool> get isPossibleToVoteStream => pollStream.map(
        (poll) => isLocalInstanceLocation && poll.isPossibleToVote,
      );

  @override
  DateTime get expiresAt => poll.expiresAt;

  @override
  bool get expired => poll.expired;

  @override
  bool get multiple => poll.multiple;

  @override
  int get votesCount => poll.votesCount;

  @override
  Stream<int> get votesCountStream => pollStream.map((poll) => poll.votesCount);

  @override
  int get votersCount => poll.votersCount;

  @override
  Stream<int> get votersCountStream => pollStream.map(
        (poll) => poll.votersCount,
      );

  @override
  void onPollOptionSelected(IPleromaPollOption pollOption) {
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
    List<int> voteIndexes = [];

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
  List<IPleromaPollOption> get selectedVotes => selectedVotesSubject.value!;

  @override
  Stream<List<IPleromaPollOption>> get selectedVotesStream =>
      selectedVotesSubject.stream.mapToNotNull();

  @override
  bool get isVoted => selectedVotes.isNotEmpty;

  @override
  Stream<bool> get isVotedStream => selectedVotesStream.map(
        (selectedVotes) => selectedVotes.isNotEmpty,
      );

  @override
  void onPollUpdated(IPleromaPoll? poll) {
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
