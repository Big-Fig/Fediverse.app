import 'package:fedi_app/app/search/recent/local_preferences/recent_search_local_preference_bloc.dart';
import 'package:fedi_app/app/search/recent/recent_search_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class RecentSearchLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<RecentSearchList?>
    implements IRecentSearchLocalPreferenceBloc {
  RecentSearchLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.search.recent',
          schemaVersion: 1,
          jsonConverter: (json) => RecentSearchList.fromJson(json),
        );

  static const RecentSearchList? defaultValue = null;

  @override
  RecentSearchList? get defaultPreferenceValue => defaultValue;
}
