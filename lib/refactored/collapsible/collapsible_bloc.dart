import 'package:fedi/refactored/collapsible/collapsible_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICollapsibleBloc extends Disposable {
  static ICollapsibleBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICollapsibleBloc>(context, listen: listen);

  bool get isCurrentVisibleItemPossibleToCollapse;

  Stream<bool> get isCurrentVisibleItemPossibleToCollapseStream;

  bool get isCurrentVisibleItemCollapsed;

  Stream<bool> get isCurrentVisibleItemCollapsedStream;

  ICollapsibleItem  get currentVisibleItem;
  Stream<ICollapsibleItem> get currentVisibleItemStream;

  changeCurrentVisibleItem(ICollapsibleItem item);

  toggleCollapse();
}
