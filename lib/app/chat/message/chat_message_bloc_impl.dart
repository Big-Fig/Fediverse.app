import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/stream/stream_extension.dart';
import 'package:rxdart/rxdart.dart';

abstract class ChatMessageBloc extends DisposableOwner
    implements IChatMessageBloc {
  BehaviorSubject<IChatMessage> get _chatMessageSubject;

  final bool isNeedWatchLocalRepositoryForUpdates;

  ChatMessageBloc({
//for better performance we don't update
    // account too often
    required bool needRefreshFromNetworkOnInit, // todo: remove hack. Don't
    // init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    required bool delayInit,
    required this.isNeedWatchLocalRepositoryForUpdates,
  }) {
    if (delayInit) {
      Future.delayed(
        Duration(seconds: 1),
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
  List<IPleromaMediaAttachment>? get mediaAttachments =>
      chatMessage.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>?> get mediaAttachmentsStream =>
      chatMessageStream.map(
        (chatMessage) => chatMessage.mediaAttachments,
      );

  @override
  IPleromaCard? get card => chatMessage.card;

  @override
  Stream<IPleromaCard?> get cardStream =>
      chatMessageStream.map((chatMessage) => chatMessage.card);

  @override
  IChatMessage get chatMessage => _chatMessageSubject.value!;

  @override
  Stream<IChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.mapToNotNull().distinct();

  @override
  IAccount get account => chatMessage.account;

  @override
  Stream<IAccount> get accountStream => chatMessageStream
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
  String get accountAvatar => account.avatar;

  @override
  Stream<String> get accountAvatarStream => accountStream
      .map(
        (account) => account.avatar,
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
  bool get isPublishedAndNotDeletedAndNotLocallyHidden =>
      chatMessage.isPublishedAndNotDeletedAndNotLocallyHidden;

  @override
  Stream<bool> get isPublishedAndNotDeletedAndNotLocallyHiddenStream =>
      chatMessageStream.map(
        (chatMessage) =>
            chatMessage.isPublishedAndNotDeletedAndNotLocallyHidden,
      );

  @override
  List<IPleromaEmoji>? get emojis => chatMessage.emojis;
}
