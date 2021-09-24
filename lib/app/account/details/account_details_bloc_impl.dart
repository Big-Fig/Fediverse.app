import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc_impl.dart';
import 'package:logging/logging.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('account_details_bloc_impl.dart');

class AccountDetailsBloc extends DisposableOwner
    implements IAccountDetailsBloc {
  @override
  final List<AccountStatusesTab> tabs;

  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;

  @override
  final NestedScrollController nestedScrollController;

  @override
  // ignore: avoid-late-keyword
  late INestedScrollControllerBloc nestedScrollControllerBloc;

  @override
  // ignore: avoid-late-keyword
  late IFediNestedScrollViewBloc fediNestedScrollViewBloc;
  final IUnifediApiAccountService unifediApiAccountService;

  AccountDetailsBloc({
    required this.currentUnifediApiAccessBloc,
    required this.unifediApiAccountService,
  })  : nestedScrollController = NestedScrollController(centerScroll: false),
        tabs = <AccountStatusesTab>[
          AccountStatusesTab.withoutReplies,
          AccountStatusesTab.pinned,
          AccountStatusesTab.media,
          AccountStatusesTab.withReplies,
          if (unifediApiAccountService.isFeatureSupported(
            unifediApiAccountService.getAccountFavouritedStatusesFeature,
          ))
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
