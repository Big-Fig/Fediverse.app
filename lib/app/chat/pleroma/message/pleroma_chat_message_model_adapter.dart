import 'package:collection/collection.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';

extension IPleromaChatMessageExtension on pleroma_lib.IPleromaChatMessage {
  DbChatMessagePopulatedWrapper toDbChatMessagePopulatedWrapper({
    required DbAccount dbAccount,
  }) {
    return DbChatMessagePopulatedWrapper(
      dbChatMessagePopulated: toDbChatMessagePopulated(
        dbAccount: dbAccount,
      ),
    );
  }

  DbChatMessagePopulated toDbChatMessagePopulated({
    required DbAccount dbAccount,
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
      emojis: emojis?.toPleromaEmojis(),
      card: card?.toPleromaCard(),
      mediaAttachment: mediaAttachment?.toPleromaMediaAttachment(),
      accountRemoteId: accountId,
      chatRemoteId: chatId,
      hiddenLocallyOnDevice: false,
      deleted: false,
      pendingState: null,
      wasSentWithIdempotencyKey: null,
      oldPendingRemoteId: null,
    );
  }

  pleroma_lib.PleromaChatMessage toPleromaChatMessage() {
    if (this is pleroma_lib.PleromaChatMessage) {
      return this as pleroma_lib.PleromaChatMessage;
    } else {
      return pleroma_lib.PleromaChatMessage(
        id: id,
        createdAt: createdAt,
        content: content,
        emojis: emojis?.toPleromaEmojis(),
        mediaAttachment:
            mediaAttachment?.toPleromaMediaAttachment(),
        accountId: accountId,
        chatId: chatId,
        card: card?.toPleromaCard(),
      );
    }
  }
}

extension IPleromaChatMessagePleromaExtension on IPleromaChatMessage {
  pleroma_lib.PleromaChatMessage toPleromaChatMessage() {
    return pleroma_lib.PleromaChatMessage(
      id: remoteId,
      createdAt: createdAt,
      content: content,
      emojis: emojis?.toPleromaEmojis(),
      mediaAttachment:
          mediaAttachments?.singleOrNull?.toPleromaMediaAttachment(),
      accountId: account.remoteId,
      chatId: chatRemoteId,
      card: card?.toPleromaCard(),
    );
  }
}
