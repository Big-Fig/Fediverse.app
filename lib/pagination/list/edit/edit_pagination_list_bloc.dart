import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPaginationListBloc<TPage extends PaginationPage<TItem?>,
    TItem> implements IPaginationListBloc<TPage, TItem> {
  static IEditPaginationListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditPaginationListBloc>(context, listen: listen);

  Future addItem(TItem item);

  Future removeItem(TItem item);

  bool isItemAdded(TItem item);

  Stream<bool> isItemAddedStream(TItem item);

  bool get isSomethingChanged;

  Stream<bool> get isSomethingChangedStream;

  Future clearChangesAndRefresh();

  List<TItem> get addedItems;

  List<TItem> get removedItems;
}
