import 'package:fedi/collapsible/item/collapsible_item_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICollapsibleOwnerBloc extends IDisposable {
  static ICollapsibleOwnerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICollapsibleOwnerBloc>(context, listen: listen);

  bool? get isAtLeastOneVisibleItemExpanded;

  Stream<bool> get isAtLeastOneVisibleItemExpandedStream;

  List<ICollapsibleItemBloc>? get visibleItems;

  Stream<List<ICollapsibleItemBloc>?> get visibleItemsStream;

  Future addVisibleItem(ICollapsibleItemBloc item);

  Future removeVisibleItem(ICollapsibleItemBloc item);

  void collapseAllVisibleItems();
}
