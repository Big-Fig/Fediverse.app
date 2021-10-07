import 'package:collection/collection.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediApiChatMessageExtension on IUnifediApiChatMessage {
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
      emojis: emojis?.toUnifediApiEmojiList(),
      card: card?.toUnifediApiCard(),
      mediaAttachment: mediaAttachment?.toUnifediApiMediaAttachment(),
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
  UnifediApiChatMessage toUnifediApiChatMessage() {
    return UnifediApiChatMessage(
      id: remoteId,
      createdAt: createdAt,
      content: content,
      emojis: emojis?.toUnifediApiEmojiList(),
      mediaAttachment:
          mediaAttachments?.singleOrNull?.toUnifediApiMediaAttachment(),
      accountId: accountRemoteId,
      chatId: chatRemoteId,
      card: card?.toUnifediApiCard(),
    );
  }
}
