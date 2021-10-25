import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatWithLastMessageRepository implements IDisposable {
  static IUnifediChatWithLastMessageRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatWithLastMessageRepository>(
        context,
        listen: listen,
      );

  Future<List<IUnifediChatWithLastMessage>> getChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat> pagination,
    UnifediChatRepositoryOrderingTermData orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Stream<List<IUnifediChatWithLastMessage>> watchChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat> pagination,
    UnifediChatRepositoryOrderingTermData orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  });
}
