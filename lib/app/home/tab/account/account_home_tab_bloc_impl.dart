import 'package:fedi/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

class AccountHomeTabBloc extends DisposableOwner
    implements IAccountHomeTabBloc {
  @override
  NestedScrollController nestedScrollController;

  @override
  INestedScrollControllerBloc nestedScrollControllerBloc;

  @override
  IFediSliverAppBarBloc fediSliverAppBarBloc;

  AccountHomeTabBloc({@required double deviceHeight}) {
    nestedScrollController = NestedScrollController(centerScroll: false);
    fediSliverAppBarBloc = FediSliverAppBarBloc(
        scrollController: nestedScrollController, deviceHeight: deviceHeight);

    nestedScrollControllerBloc = NestedScrollControllerBloc(
        nestedScrollController: nestedScrollController);

    addDisposable(scrollController: nestedScrollController);
    addDisposable(disposable: nestedScrollControllerBloc);
    addDisposable(disposable: fediSliverAppBarBloc);
  }

  @override
  void scrollToTop() {
    nestedScrollControllerBloc.scrollToTop();
  }
}
