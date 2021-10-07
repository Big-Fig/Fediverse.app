import 'package:fedi/app/account/select/recent/local_preferences/recent_select_account_local_preference_bloc.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class RecentSelectAccountLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<RecentSelectAccountList?>
    implements IRecentSelectAccountLocalPreferenceBloc {
  RecentSelectAccountLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
    required String type,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.account.select.recent.new.$type',
          schemaVersion: 1,
          jsonConverter: (json) => RecentSelectAccountList.fromJson(json),
        );

  @override
  // TODO: implement defaultValue
  RecentSelectAccountList? get defaultPreferenceValue => null;
}
