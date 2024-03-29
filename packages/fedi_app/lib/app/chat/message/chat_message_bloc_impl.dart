import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/message/chat_message_bloc.dart';
import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/app/emoji/text/emoji_text_model.dart';
import 'package:fedi_app/app/pending/pending_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ChatMessageBloc extends DisposableOwner
    implements IChatMessageBloc {
  BehaviorSubject<IChatMessage> get _chatMessageSubject;

  final bool isNeedWatchLocalRepositoryForUpdates;

  ChatMessageBloc({
//for better performance we dont update
    // account too often
    required bool needRefreshFromNetworkOnInit, // todo: remove hack. Dont
    // init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    required bool delayInit,
    required this.isNeedWatchLocalRepositoryForUpdates,
  }) {
    if (delayInit) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          _init(needRefreshFromNetworkOnInit);
        },
      );
    } else {
      _init(needRefreshFromNetworkOnInit);
    }
  }

  void _init(bool needRefreshFromNetworkOnInit) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        watchLocalRepositoryChanges();
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      chatMessage.mediaAttachments;

  @override
  Stream<List<IUnifediApiMediaAttachment>?> get mediaAttachmentsStream =>
      chatMessageStream.map(
        (chatMessage) => chatMessage.mediaAttachments,
      );

  @override
  IUnifediApiCard? get card => chatMessage.card;

  @override
  Stream<IUnifediApiCard?> get cardStream =>
      chatMessageStream.map((chatMessage) => chatMessage.card);

  @override
  IChatMessage get chatMessage => _chatMessageSubject.value;

  @override
  Stream<IChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream..distinct();

  @override
  IAccount? get account => chatMessage.account;

  @override
  Stream<IAccount?> get accountStream => chatMessageStream
      .map(
        (chatMessage) => chatMessage.account,
      )
      .distinct();

  @override
  DateTime get createdAt => chatMessage.createdAt;

  @override
  Stream<DateTime> get createdAtStream => chatMessageStream
      .map(
        (chatMessage) => chatMessage.createdAt,
      )
      .distinct();

  @override
  String get remoteId => chatMessage.remoteId;

  @override
  String? get content => chatMessage.content;

  @override
  Stream<String?> get contentStream => chatMessageStream
      .map(
        (chatMessage) => chatMessage.content,
      )
      .distinct();

  @override
  String? get accountAvatar => account?.avatar;

  @override
  Stream<String?> get accountAvatarStream => accountStream
      .map(
        (account) => account?.avatar,
      )
      .distinct();

  @override
  EmojiText? get contentWithEmojis => chatMessage.toContentEmojiText();

  @override
  Stream<EmojiText?> get contentWithEmojisStream => chatMessageStream
      .map((chatMessage) => chatMessage.toContentEmojiText())
      .distinct();

  void watchLocalRepositoryChanges();

  @override
  PendingState? get pendingState => chatMessage.pendingState;

  @override
  Stream<PendingState?> get pendingStateStream => chatMessageStream.map(
        (chatMessage) => chatMessage.pendingState,
      );

  @override
  bool get isDeleted => chatMessage.deleted;

  @override
  Stream<bool> get isDeletedStream => chatMessageStream.map(
        (chatMessage) => chatMessage.deleted,
      );

  @override
  bool get isHiddenLocallyOnDevice => chatMessage.hiddenLocallyOnDevice;

  @override
  Stream<bool> get isHiddenLocallyOnDeviceStream => chatMessageStream.map(
        (chatMessage) => chatMessage.hiddenLocallyOnDevice,
      );

  bool get isPendingStatePublishedOrNull =>
      chatMessage.isPendingStatePublishedOrNull;

  bool get isPendingStateNotPublishedOrNull =>
      chatMessage.isPendingStateNotPublishedOrNull;

  @override
  bool get isNotPending => chatMessage.isNotPending;

  @override
  Stream<bool> get isNotPendingStream => chatMessageStream.map(
        (chatMessage) => chatMessage.isNotPending,
      );

  @override
  bool get isPending => chatMessage.isPending;

  @override
  Stream<bool> get isPendingStream => chatMessageStream.map(
        (chatMessage) => chatMessage.isPending,
      );
  @override
  bool get isPendingFailed => chatMessage.isPendingFailed;

  @override
  Stream<bool> get isPendingFailedStream => chatMessageStream.map(
        (chatMessage) => chatMessage.isPendingFailed,
      );

  @override
  bool get isPublishedAndNotDeletedAndNotLocallyHidden =>
      chatMessage.isPublishedAndNotDeletedAndNotLocallyHidden;

  @override
  Stream<bool> get isPublishedAndNotDeletedAndNotLocallyHiddenStream =>
      chatMessageStream.map(
        (chatMessage) =>
            chatMessage.isPublishedAndNotDeletedAndNotLocallyHidden,
      );

  @override
  List<IUnifediApiEmoji>? get emojis => chatMessage.emojis;
}
