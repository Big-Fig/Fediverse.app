import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountDetailsBloc extends DisposableOwner {
  static IAccountDetailsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountDetailsBloc>(context, listen: listen);

  List<AccountStatusesTab> get tabs;

  ScrollController get nestedScrollController;

  INestedScrollControllerBloc get nestedScrollControllerBloc;

  IFediNestedScrollViewBloc get fediNestedScrollViewBloc;

  void scrollToTop();
}
