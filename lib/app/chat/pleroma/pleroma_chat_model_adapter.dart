import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';

extension IPleromaApiChatPleromaExtension on IPleromaApiChat {
  DbChat toDbChat() {
    var updatedAt = this.updatedAt;
    // todo: hack
    // sometimes updatedAt not exposed on server side
    updatedAt ??= lastMessage?.createdAt;
    return DbChat(
      id: null,
      remoteId: id,
      unread: unread,
      updatedAt: updatedAt,
      accountRemoteId: account.id,
    );
  }
}

extension IPleromaChatExtension on IPleromaChat {
  PleromaApiChat toPleromaApiChat({
    required IPleromaChatMessage? lastChatMessage,
    required List<IAccount> accounts,
  }) {
    assert(accounts.isNotEmpty);
    // ignore: no-magic-number
    var isSingleAccount = accounts.length < 2;
    assert(isSingleAccount, "only direct chats supported");
    return PleromaApiChat(
      unread: unread,
      lastMessage: lastChatMessage?.toPleromaApiChatMessage(),
      id: remoteId,
      account: accounts.first.toPleromaApiAccount(),
      updatedAt: updatedAt,
    );
  }
}
