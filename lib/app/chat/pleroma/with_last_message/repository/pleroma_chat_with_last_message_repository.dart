import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatWithLastMessageRepository implements IDisposable {
  static IPleromaChatWithLastMessageRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatWithLastMessageRepository>(context,
          listen: listen);

  Future<List<IPleromaChatWithLastMessage>> getChatsWithLastMessage({
    @required PleromaChatRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChat> pagination,
    PleromaChatOrderingTermData orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  });

  Stream<List<IPleromaChatWithLastMessage>> watchChatsWithLastMessage({
    @required PleromaChatRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChat> pagination,
    PleromaChatOrderingTermData orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  });
}
