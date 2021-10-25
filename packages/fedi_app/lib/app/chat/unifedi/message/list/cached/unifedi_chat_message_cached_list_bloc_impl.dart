import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/unifedi/message/list/cached/unifedi_chat_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('unifedi_chat_message_cached_list_bloc_impl.dart');

class UnifediChatMessageCachedListBloc extends DisposableOwner
    implements IUnifediChatMessageCachedListBloc {
  final IUnifediApiChatService unifediApiChatService;
  final IUnifediChatMessageRepository chatMessageRepository;
  final IUnifediChat chat;

  UnifediChatMessageRepositoryFilters
      get _unifediChatMessageRepositoryFilters =>
          UnifediChatMessageRepositoryFilters(
            onlyInChats: [
              chat,
            ],
            onlyPendingStatePublishedOrNull: false,
            onlyNotDeleted: true,
            onlyNotHiddenLocallyOnDevice: true,
          );

  UnifediChatMessageCachedListBloc({
    required this.chat,
    required this.unifediApiChatService,
    required this.chatMessageRepository,
  });

  @override
  IUnifediApiService get unifediApi => unifediApiChatService;

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IUnifediChatMessage? newerThan,
    required IUnifediChatMessage? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t chat = $chat'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    var remoteMessages = await unifediApiChatService.getChatMessages(
      chatId: chat.remoteId,
      pagination: UnifediApiPagination(
        maxId: olderThan?.remoteId,
        minId: newerThan?.remoteId,
        limit: limit,
      ),
    );

    await chatMessageRepository.upsertAllInRemoteType(
      remoteMessages,
      batchTransaction: null,
    );
  }

  @override
  Future<List<IUnifediChatMessage>> loadLocalItems({
    required int? limit,
    required IUnifediChatMessage? newerThan,
    required IUnifediChatMessage? olderThan,
  }) async {
    _logger.finest(
      () => 'start loadLocalItems \n'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    var messages = await chatMessageRepository.findAllInAppType(
      filters: _unifediChatMessageRepositoryFilters,
      pagination: RepositoryPagination(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [
        UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
      ],
    );

    _logger.finer(
      () => 'finish loadLocalItems for $chat messages ${messages.length}',
    );

    return messages;
  }

  @override
  Stream<List<IUnifediChatMessage>> watchLocalItemsNewerThanItem(
    IUnifediChatMessage? item,
  ) =>
      chatMessageRepository.watchFindAllInAppType(
        filters: _unifediChatMessageRepositoryFilters,
        pagination: RepositoryPagination(
          newerThanItem: item,
        ),
        orderingTerms: [
          UnifediChatMessageRepositoryOrderingTermData.createdAtDesc,
        ],
      );

  static UnifediChatMessageCachedListBloc createFromContext(
    BuildContext context, {
    required IUnifediChat chat,
  }) =>
      UnifediChatMessageCachedListBloc(
        chat: chat,
        unifediApiChatService:
            Provider.of<IUnifediApiChatService>(context, listen: false),
        chatMessageRepository:
            IUnifediChatMessageRepository.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required IUnifediChat chat,
    required Widget child,
  }) =>
      DisposableProvider<IUnifediChatMessageCachedListBloc>(
        create: (context) => UnifediChatMessageCachedListBloc.createFromContext(
          context,
          chat: chat,
        ),
        child: child,
      );
}
