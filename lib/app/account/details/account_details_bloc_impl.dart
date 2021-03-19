import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc_impl.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

var _logger = Logger("account_details_bloc_impl.dart");

class AccountDetailsBloc extends DisposableOwner
    implements IAccountDetailsBloc {
  @override
  final List<AccountStatusesTab> tabs;

  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;

  @override
  NestedScrollController? nestedScrollController;

  @override
  INestedScrollControllerBloc? nestedScrollControllerBloc;

  @override
  IFediNestedScrollViewBloc? fediNestedScrollViewBloc;

  AccountDetailsBloc({
    required this.currentAuthInstanceBloc,
  }) : tabs = <AccountStatusesTab>[
          AccountStatusesTab.withoutReplies,
          AccountStatusesTab.pinned,
          AccountStatusesTab.media,
          AccountStatusesTab.withReplies,
          if (currentAuthInstanceBloc
              .currentInstance!.isAccountFavouritesFeatureSupported!)
            AccountStatusesTab.favourites,
        ] {
    nestedScrollController = NestedScrollController(centerScroll: false);

    nestedScrollControllerBloc = NestedScrollControllerBloc(
      nestedScrollController: nestedScrollController,
    );
    fediNestedScrollViewBloc = FediNestedScrollViewBloc(
      nestedScrollControllerBloc: nestedScrollControllerBloc,
    );

    addDisposable(disposable: fediNestedScrollViewBloc);
    addDisposable(disposable: nestedScrollControllerBloc);
    addDisposable(custom: () {
      try {
        nestedScrollController!.dispose();
      } catch (e) {
        _logger.warning(() => "error during nestedScrollController.dispose()");
      }
    });
  }

  @override
  void scrollToTop() {
    nestedScrollControllerBloc!.scrollToTop();
  }
}
