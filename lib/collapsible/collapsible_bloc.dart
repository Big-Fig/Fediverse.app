import 'package:fedi/collapsible/collapsible_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICollapsibleBloc extends IDisposable {
  static ICollapsibleBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICollapsibleBloc>(context, listen: listen);

  bool get isAtLeastOneVisibleItemExpanded;

  Stream<bool> get isAtLeastOneVisibleItemExpandedStream;

  List<ICollapsibleItem> get visibleItems;

  Stream<List<ICollapsibleItem>> get visibleItemsStream;

  Future addVisibleItem(ICollapsibleItem item);

  Future removeVisibleItem(ICollapsibleItem item);

  void collapseAllVisibleItems();
}
