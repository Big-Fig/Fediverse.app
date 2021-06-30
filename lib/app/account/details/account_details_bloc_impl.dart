import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc_impl.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

var _logger = Logger('account_details_bloc_impl.dart');

class AccountDetailsBloc extends DisposableOwner
    implements IAccountDetailsBloc {
  @override
  final List<AccountStatusesTab> tabs;

  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;

  @override
  final NestedScrollController nestedScrollController;

  @override
  // ignore: avoid-late-keyword
  late INestedScrollControllerBloc nestedScrollControllerBloc;

  @override
  // ignore: avoid-late-keyword
  late IFediNestedScrollViewBloc fediNestedScrollViewBloc;

  AccountDetailsBloc({
    required this.currentAuthInstanceBloc,
  })   : nestedScrollController = NestedScrollController(centerScroll: false),
        tabs = <AccountStatusesTab>[
          AccountStatusesTab.withoutReplies,
          AccountStatusesTab.pinned,
          AccountStatusesTab.media,
          AccountStatusesTab.withReplies,
          if (currentAuthInstanceBloc
              .currentInstance!.isAccountFavouritesFeatureSupported!)
            AccountStatusesTab.favourites,
        ] {
    nestedScrollControllerBloc = NestedScrollControllerBloc(
      nestedScrollController: nestedScrollController,
    );
    fediNestedScrollViewBloc = FediNestedScrollViewBloc(
      nestedScrollControllerBloc: nestedScrollControllerBloc,
    );
    addCustomDisposable(() {
      try {
        nestedScrollController.dispose();
      } catch (e) {
        _logger.warning(() => 'error during nestedScrollController.dispose()');
      }
    });

    fediNestedScrollViewBloc.disposeWith(this);
    nestedScrollControllerBloc.disposeWith(this);
  }

  @override
  void scrollToTop() {
    nestedScrollControllerBloc.scrollToTop();
  }
}
