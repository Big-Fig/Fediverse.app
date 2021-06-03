import 'package:fedi/collapsible/item/collapsible_item_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCollapsibleItemBloc
    implements IDisposable, ICollapsibleItemBloc {
  static IStatusCollapsibleItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusCollapsibleItemBloc>(context, listen: listen);
}
