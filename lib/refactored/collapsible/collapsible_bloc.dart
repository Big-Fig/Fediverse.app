import 'package:fedi/refactored/collapsible/collapsible_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICollapsibleBloc extends Disposable {
  static ICollapsibleBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICollapsibleBloc>(context, listen: listen);

  bool get isAtLeastOneVisibleItemExpanded;

  Stream<bool> get isAtLeastOneVisibleItemExpandedStream;

  List<ICollapsibleItem> get visibleItems;

  Stream<List<ICollapsibleItem>> get visibleItemsStream;

  addVisibleItem(ICollapsibleItem item);

  removeVisibleItem(ICollapsibleItem item);

  collapseAllVisibleItems();
}
