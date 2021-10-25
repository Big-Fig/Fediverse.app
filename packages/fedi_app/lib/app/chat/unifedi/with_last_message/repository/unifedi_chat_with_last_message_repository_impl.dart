import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/repository/unifedi_chat_with_last_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/repository/repository_model.dart';

class UnifediChatWithLastMessageRepository extends AsyncInitLoadingBloc
    implements IUnifediChatWithLastMessageRepository {
  final IUnifediChatRepository chatRepository;
  final IUnifediChatMessageRepository chatMessageRepository;

  UnifediChatWithLastMessageRepository({
    required this.chatRepository,
    required this.chatMessageRepository,
  });

  @override
  // ignore: no-empty-block
  Future<void> internalAsyncInit() async {
    // nothing by now
  }

  @override
  Future<List<IUnifediChatWithLastMessage>> getChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat> pagination,
    UnifediChatRepositoryOrderingTermData orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  }) async {
    var chats = await chatRepository.getChatsWithLastMessage(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return chats;
  }

  @override
  Stream<List<IUnifediChatWithLastMessage>> watchChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat> pagination,
    UnifediChatRepositoryOrderingTermData orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  }) =>
      chatRepository.watchChatsWithLastMessage(
        filters: filters,
        pagination: pagination,
        orderingTermData: orderingTermData,
      );
}
