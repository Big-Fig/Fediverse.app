import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'conversation_chat_message_model.freezed.dart';

abstract class IConversationChatMessage extends IChatMessage
    implements IEqualComparableObj<IConversationChatMessage> {
  IStatus get status;
}

extension IStatusConversationChatMessageExtension on IStatus {
  ConversationChatMessageStatusAdapter
      toConversationChatMessageStatusAdapter() =>
          ConversationChatMessageStatusAdapter(status: this);
}

extension IUnifediApiStatusConversationChatMessageExtension
    on IUnifediApiStatus {
  ConversationChatMessageStatusAdapter
      toConversationChatMessageStatusAdapter() =>
          ConversationChatMessageStatusAdapter(
            status: DbStatusPopulatedWrapper(
              dbStatusPopulated: DbStatusPopulated(
                dbStatus: toDbStatus(),
                dbAccount: account.toDbAccount(),
                reblogDbStatus: reblog?.toDbStatus(),
                reblogDbStatusAccount: reblog?.account.toDbAccount(),
                replyDbStatus: null,
                replyDbStatusAccount: null,
                replyReblogDbStatus: null,
                replyReblogDbStatusAccount: null,
              ),
            ),
          );
}

@freezed
class ConversationChatMessageStatusAdapter
    with _$ConversationChatMessageStatusAdapter
    implements IConversationChatMessage {
  const ConversationChatMessageStatusAdapter._();

  const factory ConversationChatMessageStatusAdapter({
    required IStatus status,
  }) = _ConversationChatMessageStatusAdapter;

  @override
  int? get localId => status.localId;

  @override
  IAccount get account => status.account;

  @override
  String get chatRemoteId => status.directConversationId!.toString();

  @override
  String? get content => status.content;

  @override
  IUnifediApiCard? get card => status.card;

  @override
  DateTime get createdAt => status.createdAt;

  @override
  List<IUnifediApiEmoji>? get emojis => status.emojis;

  @override
  String get remoteId => status.remoteId!;

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      status.mediaAttachments;

  @override
  PendingState? get pendingState => status.pendingState;

  @override
  String? get oldPendingRemoteId => status.oldPendingRemoteId;

  @override
  bool get deleted => status.deleted;

  @override
  bool get hiddenLocallyOnDevice => status.hiddenLocallyOnDevice;

  @override
  String? get wasSentWithIdempotencyKey => status.wasSentWithIdempotencyKey;

  @override
  String get accountRemoteId => status.account.remoteId;

  @override
  int compareTo(IConversationChatMessage b) => IStatus.compareItemsToSort(
        status,
        b.status,
      );

  @override
  bool isEqualTo(IConversationChatMessage b) => IStatus.isItemsEqual(
        status,
        b.status,
      );
}
