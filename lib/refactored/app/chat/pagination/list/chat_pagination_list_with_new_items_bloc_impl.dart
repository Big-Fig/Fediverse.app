import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/list/cached/chat_cached_list_service.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class ChatPaginationListWithNewItemsBloc<TPage extends PaginationPage<IChat>>
    extends PaginationListWithNewItemsBloc<TPage, IChat> {
  final IChatCachedListService cachedListService;

  ChatPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.cachedListService,
      @required IPaginationBloc<TPage, IChat> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IChat>> watchItemsNewerThanItem(IChat item) =>
      cachedListService.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(IChat a, IChat b) {
    if (a?.updatedAt == null && b?.updatedAt == null) {
      return 0;
    }

    if (a?.updatedAt != null && b?.updatedAt == null) {
      return -1;
    }
    if (a?.updatedAt == null && b?.updatedAt != null) {
      return 1;
    }
    return a.updatedAt.compareTo(b.updatedAt);
  }

  @override
  bool isItemsEqual(IChat a, IChat b) => a.remoteId == b.remoteId;
}
