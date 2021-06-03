import 'package:fedi/app/account/select/recent/local_preferences/recent_select_account_local_preference_bloc.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/share/select_account/recent/recent_share_select_account_bloc.dart';

class RecentShareSelectAccountBloc extends RecentSelectAccountBloc
    implements IRecentShareSelectAccountBloc {
  RecentShareSelectAccountBloc({
    // todo: refactor
    // ignore: no-magic-number
    int recentCountLimit = 20,
    required ISelectAccountListBloc selectAccountListBloc,
    required IRecentSelectAccountLocalPreferenceBloc
        recentSelectAccountLocalPreferenceBloc,
  }) : super(
          recentCountLimit: recentCountLimit,
          selectAccountListBloc: selectAccountListBloc,
          recentSelectAccountLocalPreferenceBloc:
              recentSelectAccountLocalPreferenceBloc,
        );
}
