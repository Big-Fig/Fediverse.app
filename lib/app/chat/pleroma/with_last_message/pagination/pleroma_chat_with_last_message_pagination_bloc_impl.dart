import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/pleroma_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';

class PleromaChatWithLastMessagePaginationBloc
    extends CachedPleromaPaginationBloc<IPleromaChatWithLastMessage>
    implements IPleromaChatWithLastMessagePaginationBloc {
  final IPleromaChatWithLastMessageCachedBloc listService;

  PleromaChatWithLastMessagePaginationBloc({
    @required this.listService,
    @required IPaginationSettingsBloc paginationSettingsBloc,
    @required int maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IPleromaChatWithLastMessage>> loadLocalItems({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required CachedPaginationPage<IPleromaChatWithLastMessage> olderPage,
    @required CachedPaginationPage<IPleromaChatWithLastMessage> newerPage,
  }) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required CachedPaginationPage<IPleromaChatWithLastMessage> olderPage,
    @required CachedPaginationPage<IPleromaChatWithLastMessage> newerPage,
  }) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }
}
