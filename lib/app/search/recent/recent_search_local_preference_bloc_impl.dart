import 'package:fedi/app/search/recent/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class RecentSearchLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<RecentSearchList>
    implements IRecentSearchLocalPreferenceBloc {
  RecentSearchLocalPreferenceBloc(
      String userAtHost, ILocalPreferencesService preferencesService)
      : super(preferencesService, "$userAtHost.search.recent", 1);
}
