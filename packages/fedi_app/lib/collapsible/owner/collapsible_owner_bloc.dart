import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/collapsible/item/collapsible_item_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICollapsibleOwnerBloc extends IDisposable {
  static ICollapsibleOwnerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICollapsibleOwnerBloc>(context, listen: listen);

  bool? get isAtLeastOneVisibleItemExpanded;

  Stream<bool> get isAtLeastOneVisibleItemExpandedStream;

  List<ICollapsibleItemBloc>? get visibleItems;

  Stream<List<ICollapsibleItemBloc>?> get visibleItemsStream;

  Future<void> addVisibleItem(ICollapsibleItemBloc item);

  Future<void> removeVisibleItem(ICollapsibleItemBloc item);

  void collapseAllVisibleItems();
}
