import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:rxdart/rxdart.dart';

class StatusEmojiReactionBloc extends DisposableOwner
    implements IStatusEmojiReactionBloc {
  final IStatus status;

  // ignore: close_sinks
  BehaviorSubject<IPleromaApiStatusEmojiReaction> emojiReactionSubject;

  @override
  Stream<IPleromaApiStatusEmojiReaction> get emojiReactionStream =>
      emojiReactionSubject.stream;

  @override
  IPleromaApiStatusEmojiReaction get emojiReaction =>
      emojiReactionSubject.value;

  StatusEmojiReactionBloc({
    required this.status,
    required IPleromaApiStatusEmojiReaction emojiReaction,
  }) : emojiReactionSubject = BehaviorSubject.seeded(emojiReaction) {
    emojiReactionSubject.disposeWith(this);
  }

  @override
  Future<IPleromaApiStatus> toggleEmojiReaction() async {
    throw Exception(
      'You cant interact with emoji reactions when you not logged in',
    );
  }
}

class AuthStatusEmojiReactionBloc extends StatusEmojiReactionBloc
    implements IStatusEmojiReactionBloc {
  final IStatusRepository statusRepository;

  final IPleromaApiStatusEmojiReactionService
      pleromaApiStatusEmojiReactionService;

  AuthStatusEmojiReactionBloc({
    required IStatus status,
    required this.statusRepository,
    required IPleromaApiStatusEmojiReaction emojiReaction,
    required this.pleromaApiStatusEmojiReactionService,
  }) : super(
          status: status,
          emojiReaction: emojiReaction,
        );

  @override
  Future<IPleromaApiStatus> toggleEmojiReaction() async {
    IPleromaApiStatus remoteStatus;
    if (emojiReaction.me) {
      remoteStatus = await pleromaApiStatusEmojiReactionService.removeReaction(
        statusRemoteId: status.remoteId!,
        emoji: emojiReaction.name,
      );
    } else {
      remoteStatus = await pleromaApiStatusEmojiReactionService.addReaction(
        statusRemoteId: status.remoteId!,
        emoji: emojiReaction.name,
      );
    }

    await statusRepository.upsertInRemoteType(
      remoteStatus,
    );

    return remoteStatus;
  }
}
