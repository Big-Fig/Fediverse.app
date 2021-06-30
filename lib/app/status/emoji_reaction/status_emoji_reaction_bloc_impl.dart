import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:rxdart/rxdart.dart';

class StatusEmojiReactionBloc extends DisposableOwner
    implements IStatusEmojiReactionBloc {
  final IStatus status;
  final IStatusRepository statusRepository;

  // ignore: close_sinks
  BehaviorSubject<IPleromaApiStatusEmojiReaction> emojiReactionSubject;

  @override
  Stream<IPleromaApiStatusEmojiReaction> get emojiReactionStream =>
      emojiReactionSubject.stream;

  @override
  IPleromaApiStatusEmojiReaction get emojiReaction =>
      emojiReactionSubject.value;
  final IPleromaApiStatusEmojiReactionService
      PleromaApiStatusEmojiReactionService;

  StatusEmojiReactionBloc({
    required this.status,
    required this.statusRepository,
    required IPleromaApiStatusEmojiReaction emojiReaction,
    required this.PleromaApiStatusEmojiReactionService,
  }) : emojiReactionSubject = BehaviorSubject.seeded(emojiReaction) {
    emojiReactionSubject.disposeWith(this);
  }

  @override
  Future<IPleromaApiStatus> toggleEmojiReaction() async {
    IPleromaApiStatus remoteStatus;
    if (emojiReaction.me) {
      remoteStatus = await PleromaApiStatusEmojiReactionService.removeReaction(
        statusRemoteId: status.remoteId!,
        emoji: emojiReaction.name,
      );
    } else {
      remoteStatus = await PleromaApiStatusEmojiReactionService.addReaction(
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
