import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/list/cached/chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/pagination/cached/chat_cached_pagination_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IChatListContainerBloc extends Disposable {
  static IChatListContainerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatListContainerBloc>(context, listen: listen);

  IChatCachedListBloc get chatListService;

  IChatCachedPaginationBloc get chatPaginationBloc;

  IPaginationListBloc<PaginationPage<IChat>, IChat> get chatPaginationListBloc;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IChat>, IChat>
      get chatPaginationListWithNewItemsBloc;
}
