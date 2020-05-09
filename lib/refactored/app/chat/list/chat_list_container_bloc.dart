import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/list/cached/chat_cached_list_service.dart';
import 'package:fedi/refactored/app/chat/pagination/chat_pagination_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IChatListContainerBloc extends Disposable {
  static IChatListContainerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatListContainerBloc>(context, listen: listen);

  IChatCachedListService get chatListService;

  IChatPaginationBloc get chatPaginationBloc;

  IPaginationListBloc<PaginationPage<IChat>, IChat>
      get chatPaginationListBloc;
}
