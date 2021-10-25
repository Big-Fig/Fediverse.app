import 'package:fedi_app/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class MyAccountLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiMyAccountWrapper?>
    implements IMyAccountLocalPreferenceBloc {
  static const UnifediApiMyAccountWrapper? defaultValue = null;

  MyAccountLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: 'access.account.my.$userAtHost',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiMyAccountWrapper.fromJson(json),
        );

  @override
  UnifediApiMyAccountWrapper? get defaultPreferenceValue => defaultValue;
}
