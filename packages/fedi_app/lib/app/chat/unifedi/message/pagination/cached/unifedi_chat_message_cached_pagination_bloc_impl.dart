import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/unifedi/message/list/cached/unifedi_chat_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/message/pagination/cached/unifedi_chat_message_cached_pagination_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UnifediChatMessageCachedPaginationBloc
    extends CachedUnifediPaginationBloc<IUnifediChatMessage>
    implements IUnifediChatMessageCachedPaginationBloc {
  final IUnifediChatMessageCachedListBloc chatMessageListService;

  UnifediChatMessageCachedPaginationBloc({
    required this.chatMessageListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => chatMessageListService.unifediApi;

  @override
  Future<List<IUnifediChatMessage>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IUnifediChatMessage>? olderPage,
    required CachedPaginationPage<IUnifediChatMessage>? newerPage,
  }) =>
      chatMessageListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.firstOrNull,
        olderThan: newerPage?.items.lastOrNull,
      );

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IUnifediChatMessage>? olderPage,
    required CachedPaginationPage<IUnifediChatMessage>? newerPage,
  }) async {
    assert(
      !(pageIndex > 0 && olderPage == null && newerPage == null),
      'cant refresh not first page without actual items bounds',
    );

    return chatMessageListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  static UnifediChatMessageCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      UnifediChatMessageCachedPaginationBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        chatMessageListService: Provider.of<IUnifediChatMessageCachedListBloc>(
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
  }) =>
      DisposableProvider<
          ICachedPaginationBloc<CachedPaginationPage<IUnifediChatMessage>,
              IUnifediChatMessage>>(
        create: (context) =>
            UnifediChatMessageCachedPaginationBloc.createFromContext(
          context,
          maximumCachedPagesCount: maximumCachedPagesCount,
        ),
        child: CachedPaginationBlocProxyProvider<
            CachedPaginationPage<IUnifediChatMessage>, IUnifediChatMessage>(
          child: child,
        ),
      );
}
