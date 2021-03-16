import 'package:fedi/app/account/select/recent/local_preferences/recent_select_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/share/select_account/recent/local_preferences/recent_share_select_account_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class RecentShareSelectAccountLocalPreferenceBloc
    extends RecentSelectAccountLocalPreferenceBloc
    implements IRecentShareSelectAccountLocalPreferenceBloc {
  RecentShareSelectAccountLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          userAtHost: userAtHost,
          type: "share",
        );
}
