import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPaginationListWithNewItemsBloc<
    TPage extends PaginationPage<TItem>,
    TItem> implements IPaginationListBloc<TPage, TItem> {
  static IPaginationListWithNewItemsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPaginationListWithNewItemsBloc>(context, listen: listen);


  TItem get newerItem;
  Stream<TItem> get newerItemStream;

  List<TItem> get unmergedNewItems;

  Stream<List<TItem>> get unmergedNewItemsStream;

  int get unmergedNewItemsCount;

  Stream<int> get unmergedNewItemsCountStream;

  List<TItem> get mergedNewItems;

  Stream<List<TItem>> get mergedNewItemsStream;

  int get mergedNewItemsCount;

  Stream<int> get mergedNewItemsCountStream;

  mergeNewItems();

  bool get mergeNewItemsImmediately;
}
