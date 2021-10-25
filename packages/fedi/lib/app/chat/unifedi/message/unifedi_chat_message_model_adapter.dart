import 'package:collection/collection.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediApiChatMessageExtension on IUnifediApiChatMessage {
  DbUnifediChatMessagePopulatedWrapper toDbChatMessagePopulatedWrapper({
    required DbAccount? dbAccount,
  }) =>
      DbUnifediChatMessagePopulatedWrapper(
        dbChatMessagePopulated: toDbChatMessagePopulated(
          dbAccount: dbAccount,
        ),
      );

  DbChatMessagePopulated toDbChatMessagePopulated({
    required DbAccount? dbAccount,
  }) =>
      DbChatMessagePopulated(
        dbChatMessage: toDbChatMessage(),
        dbAccount: dbAccount,
      );

  DbChatMessage toDbChatMessage() => DbChatMessage(
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

extension IUnifediChatMessageUnifediExtension on IUnifediChatMessage {
  UnifediApiChatMessage toUnifediApiChatMessage() => UnifediApiChatMessage(
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
