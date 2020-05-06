import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class StatusEmojiReactionBloc extends DisposableOwner
    implements IStatusEmojiReactionBloc {
  final IStatus status;
  final IStatusRepository statusRepository;

  // ignore: close_sinks
  BehaviorSubject<IPleromaStatusEmojiReaction> emojiReactionSubject;

  @override
  Stream<IPleromaStatusEmojiReaction> get emojiReactionStream =>
      emojiReactionSubject.stream;

  @override
  IPleromaStatusEmojiReaction get emojiReaction => emojiReactionSubject.value;
  final IPleromaStatusEmojiReactionService pleromaStatusEmojiReactionService;

  StatusEmojiReactionBloc(
      {@required this.status,
      @required this.statusRepository,
      @required IPleromaStatusEmojiReaction emojiReaction,
      @required this.pleromaStatusEmojiReactionService})
      : emojiReactionSubject = BehaviorSubject.seeded(emojiReaction) {
    addDisposable(subject: emojiReactionSubject);
  }

  @override
  Future<IPleromaStatus> requestToggleEmojiReaction() async {
    IPleromaStatus remoteStatus;
    if (emojiReaction.me) {
      remoteStatus = await pleromaStatusEmojiReactionService.removeReaction(
          statusRemoteId: status.remoteId, emoji: emojiReaction.name);
    } else {
      remoteStatus = await pleromaStatusEmojiReactionService.addReaction(
          statusRemoteId: status.remoteId, emoji: emojiReaction.name);
    }

    var newReaction = remoteStatus.pleroma?.emojiReactions?.firstWhere(
        (currentReaction) => currentReaction.name == emojiReaction.name,
        orElse: () => null);

    emojiReactionSubject.add(newReaction);

    await statusRepository.upsertRemoteStatus(remoteStatus,
        listRemoteId: null, conversationRemoteId: null);

    return remoteStatus;
  }
}
