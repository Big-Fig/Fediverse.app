import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class MyAccountLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<PleromaMyAccountWrapper?>
    implements IMyAccountLocalPreferenceBloc {

  static const PleromaMyAccountWrapper? defaultValue = null;

  MyAccountLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: 'account.my.$userAtHost',
          schemaVersion: 1,
          jsonConverter: (json) => PleromaMyAccountWrapper.fromJson(json),
        );

  @override
  PleromaMyAccountWrapper? get defaultPreferenceValue => defaultValue;
}
