import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model_adapter.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediApiChatUnifediExtension on IUnifediApiChat {
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

extension IUnifediChatExtension on IUnifediChat {
  UnifediApiChat toUnifediApiChat({
    required IUnifediChatMessage? lastChatMessage,
    required List<IAccount> accounts,
  }) {
    assert(
      accounts.isNotEmpty,
      'accounts should be not empty',
    );
    // ignore: no-magic-number
    var isSingleAccount = accounts.length < 2;
    assert(isSingleAccount, 'only direct chats supported');

    return UnifediApiChat(
      unread: unread,
      lastMessage: lastChatMessage?.toUnifediApiChatMessage(),
      id: remoteId,
      account: accounts.first.toUnifediApiAccount(),
      updatedAt: updatedAt,
    );
  }
}
