import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatWithLastMessageRepository implements IDisposable {
  static IChatWithLastMessageRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatWithLastMessageRepository>(context, listen: listen);

  Future<List<IChatWithLastMessage>> getChatsWithLastMessage(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData});

  Stream<List<IChatWithLastMessage>> watchChatsWithLastMessage(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData});

  Future<IChatWithLastMessage> getChatWithLastMessage(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData});

  Stream<IChatWithLastMessage> watchChatWithLastMessage(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData});
}
