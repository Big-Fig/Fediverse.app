import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/chat/message/pagination/network_only/chat_message_network_only_pagination_bloc.dart';
import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatMessageNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IChatMessage>
    implements IChatMessageNetworkOnlyPaginationBloc {
  final IPleromaNetworkOnlyListService<IChatMessage> listService;

  ChatMessageNetworkOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static ChatMessageNetworkOnlyPaginationBloc createFromContext(BuildContext context,
          {int itemsCountPerPage = 20, int maximumCachedPagesCount}) =>
      ChatMessageNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: Provider.of<IPleromaNetworkOnlyListService<IChatMessage>>(
              context,
              listen: false));

  @override
  Future<List<IChatMessage>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<IChatMessage> olderPage,
          @required PaginationPage<IChatMessage> newerPage}) =>
      listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items?.last?.remoteId,
        maxId: olderPage?.items?.first?.remoteId,
      );
}
