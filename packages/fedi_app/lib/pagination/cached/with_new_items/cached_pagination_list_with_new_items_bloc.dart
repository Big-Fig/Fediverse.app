import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICachedPaginationListWithNewItemsBloc<
    TPage extends CachedPaginationPage<TItem>,
    TItem> implements ICachedPaginationListBloc<TPage, TItem> {
  static ICachedPaginationListWithNewItemsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICachedPaginationListWithNewItemsBloc>(
        context,
        listen: listen,
      );

  TItem? get newerItem;

  Stream<TItem?> get newerItemStream;

  List<TItem> get unmergedNewItems;

  Stream<List<TItem>> get unmergedNewItemsStream;

  int get unmergedNewItemsCount;

  Stream<int> get unmergedNewItemsCountStream;

  List<TItem> get mergedNewItems;

  Stream<List<TItem>> get mergedNewItemsStream;

  int get mergedNewItemsCount;

  Stream<int> get mergedNewItemsCountStream;

  void mergeNewItems();

  bool get mergeNewItemsImmediately;

  void onItemUpdated(TItem item);
}
