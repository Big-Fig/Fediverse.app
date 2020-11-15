import 'package:fedi/app/search/recent/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class RecentSearchLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<RecentSearchList>
    implements IRecentSearchLocalPreferenceBloc {
  RecentSearchLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
  }) : super(
          preferencesService,
          "$userAtHost.search.recent",
          1,
          (json) => RecentSearchList.fromJson(json),
        );
}
