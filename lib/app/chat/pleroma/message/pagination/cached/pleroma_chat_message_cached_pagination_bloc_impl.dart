import 'package:collection/collection.dart';
import 'package:fedi/app/chat/pleroma/message/list/cached/pleroma_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pagination/cached/pleroma_chat_message_cached_pagination_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatMessageCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IPleromaChatMessage>
    implements IPleromaChatMessageCachedPaginationBloc {
  final IPleromaChatMessageCachedListBloc chatMessageListService;

  PleromaChatMessageCachedPaginationBloc({
    required this.chatMessageListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => chatMessageListService.pleromaApi;

  @override
  Future<List<IPleromaChatMessage>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IPleromaChatMessage>? olderPage,
    required CachedPaginationPage<IPleromaChatMessage>? newerPage,
  }) {
    return chatMessageListService.loadLocalItems(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IPleromaChatMessage>? olderPage,
    required CachedPaginationPage<IPleromaChatMessage>? newerPage,
  }) async {
    // cant refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return chatMessageListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  static PleromaChatMessageCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      PleromaChatMessageCachedPaginationBloc(
        chatMessageListService: Provider.of<IPleromaChatMessageCachedListBloc>(
          context,
          listen: false,
        ),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
      );

  static Widget provideToContext(
    BuildContext context, {
    // ignore: no-magic-number
    int itemsCountPerPage = 20,
    int? maximumCachedPagesCount,
    required Widget child,
  }) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<IPleromaChatMessage>,
            IPleromaChatMessage>>(
      create: (context) =>
          PleromaChatMessageCachedPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<IPleromaChatMessage>, IPleromaChatMessage>(
        child: child,
      ),
    );
  }
}
