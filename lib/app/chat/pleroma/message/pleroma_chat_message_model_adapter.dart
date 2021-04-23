import 'package:collection/collection.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart' as pleroma_lib;
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';

extension IPleromaChatMessageExtension on pleroma_lib.IPleromaApiChatMessage {
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

  pleroma_lib.PleromaApiChatMessage toPleromaChatMessage() {
    if (this is pleroma_lib.PleromaApiChatMessage) {
      return this as pleroma_lib.PleromaApiChatMessage;
    } else {
      return pleroma_lib.PleromaApiChatMessage(
        id: id,
        createdAt: createdAt,
        content: content,
        emojis: emojis?.toPleromaApiEmojis(),
        mediaAttachment:
            mediaAttachment?.toPleromaApiMediaAttachment(),
        accountId: accountId,
        chatId: chatId,
        card: card?.toPleromaApiCard(),
      );
    }
  }
}

extension IPleromaChatMessagePleromaExtension on IPleromaChatMessage {
  pleroma_lib.PleromaApiChatMessage toPleromaChatMessage() {
    return pleroma_lib.PleromaApiChatMessage(
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
