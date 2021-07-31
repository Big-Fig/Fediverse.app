import 'package:collection/collection.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

extension IPleromaApiChatMessageExtension on IPleromaApiChatMessage {
  DbPleromaChatMessagePopulatedWrapper toDbChatMessagePopulatedWrapper({
    required DbAccount? dbAccount,
  }) {
    return DbPleromaChatMessagePopulatedWrapper(
      dbChatMessagePopulated: toDbChatMessagePopulated(
        dbAccount: dbAccount,
      ),
    );
  }

  DbChatMessagePopulated toDbChatMessagePopulated({
    required DbAccount? dbAccount,
  }) {
    return DbChatMessagePopulated(
      dbChatMessage: toDbChatMessage(),
      dbAccount: dbAccount,
    );
  }

  DbChatMessage toDbChatMessage() {
    return DbChatMessage(
      id: null,
      remoteId: id,
      createdAt: createdAt,
      content: content,
      emojis: emojis?.toPleromaApiEmojis(),
      card: card?.toPleromaApiCard(),
      mediaAttachment: mediaAttachment?.toPleromaApiMediaAttachment(),
      accountRemoteId: accountId,
      chatRemoteId: chatId,
      hiddenLocallyOnDevice: false,
      deleted: false,
      pendingState: null,
      wasSentWithIdempotencyKey: null,
      oldPendingRemoteId: null,
    );
  }
}

extension IPleromaChatMessagePleromaExtension on IPleromaChatMessage {
  PleromaApiChatMessage toPleromaApiChatMessage() {
    return PleromaApiChatMessage(
      id: remoteId,
      createdAt: createdAt,
      content: content,
      emojis: emojis?.toPleromaApiEmojis(),
      mediaAttachment:
          mediaAttachments?.singleOrNull?.toPleromaApiMediaAttachment(),
      accountId: accountRemoteId,
      chatId: chatRemoteId,
      card: card?.toPleromaApiCard(),
    );
  }
}
