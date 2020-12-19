import 'package:fedi/app/chat/pleroma/list/cached/pleroma_chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_chat;
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("pleroma_chat_cached_list_bloc_impl.dart");

class PleromaChatCachedListBloc extends IPleromaChatCachedListBloc {
  final IPleromaChatService pleromaChatService;
  final IPleromaChatRepository chatRepository;

  PleromaChatCachedListBloc(
      {@required this.pleromaChatService, @required this.chatRepository});

  @override
  IPleromaApi get pleromaApi => pleromaChatService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IPleromaChat newerThan,
      @required IPleromaChat olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<pleroma_chat.IPleromaChat> remoteChats;

    remoteChats = await pleromaChatService.getChats(
      pagination: PleromaPaginationRequest(
        maxId: olderThan?.remoteId,
        sinceId: newerThan?.remoteId,
        limit: limit,
      ),
    );

    if (remoteChats != null) {
      await chatRepository.upsertRemoteChats(remoteChats);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "chats is null");
      return false;
    }
  }

  @override
  Future<List<IPleromaChat>> loadLocalItems(
      {@required int limit,
      @required IPleromaChat newerThan,
      @required IPleromaChat olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var chats = await chatRepository.getChats(
      olderThan: olderThan,
      newerThan: newerThan,
      limit: limit,
      offset: null,
      orderingTermData: PleromaChatOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: PleromaChatOrderByType.updatedAt),
    );

    _logger.finer(() => "finish loadLocalItems chats ${chats.length}");
    return chats;
  }

  @override
  Stream<List<IPleromaChat>> watchLocalItemsNewerThanItem(IPleromaChat item) =>
      chatRepository.watchChats(
          olderThan: null,
          newerThan: item,
          limit: null,
          offset: null,
          orderingTermData: PleromaChatOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: PleromaChatOrderByType.updatedAt));
}
