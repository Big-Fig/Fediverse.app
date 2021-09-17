import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:rxdart/rxdart.dart';

class StatusEmojiReactionBloc extends DisposableOwner
    implements IStatusEmojiReactionBloc {
  final IStatus status;

  // ignore: close_sinks
  BehaviorSubject<IUnifediApiEmojiReaction> emojiReactionSubject;

  @override
  Stream<IUnifediApiEmojiReaction> get emojiReactionStream =>
      emojiReactionSubject.stream;

  @override
  IUnifediApiEmojiReaction get emojiReaction =>
      emojiReactionSubject.value;

  StatusEmojiReactionBloc({
    required this.status,
    required IUnifediApiEmojiReaction emojiReaction,
  }) : emojiReactionSubject = BehaviorSubject.seeded(emojiReaction) {
    emojiReactionSubject.disposeWith(this);
  }

  @override
  Future<IUnifediApiStatus> toggleEmojiReaction() async {
    throw Exception(
      'You cant interact with emoji reactions when you not logged in',
    );
  }
}

class AuthStatusEmojiReactionBloc extends StatusEmojiReactionBloc
    implements IStatusEmojiReactionBloc {
  final IStatusRepository statusRepository;

  final IUnifediApiStatusService
  unifediApiStatusService;

  AuthStatusEmojiReactionBloc({
    required IStatus status,
    required this.statusRepository,
    required IUnifediApiEmojiReaction emojiReaction,
    required this.unifediApiStatusService,
  }) : super(
          status: status,
          emojiReaction: emojiReaction,
        );

  @override
  Future<IUnifediApiStatus> toggleEmojiReaction() async {
    IUnifediApiStatus remoteStatus;
    if (emojiReaction.me) {
      remoteStatus = await unifediApiStatusService.removeEmojiReaction(
        statusId: status.remoteId!,
        emoji: emojiReaction.name,
      );
    } else {
      remoteStatus = await unifediApiStatusService.addEmojiReaction(
        statusId: status.remoteId!,
        emoji: emojiReaction.name,
      );
    }

    await statusRepository.upsertInRemoteType(
      remoteStatus,
    );

    return remoteStatus;
  }
}
