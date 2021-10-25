import 'package:fedi_app/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi_app/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc_impl.dart';

class AccountHomeTabBloc extends HomeTabBloc implements IAccountHomeTabBloc {
  @override
  final List<AccountStatusesTab> tabs;

  AccountHomeTabBloc()
      : tabs = <AccountStatusesTab>[
          AccountStatusesTab.withoutReplies,
          AccountStatusesTab.pinned,
          AccountStatusesTab.media,
          AccountStatusesTab.withReplies,
          // favourites for own account supported on Unifedi and Mastodon
          AccountStatusesTab.favourites,
        ];
}
