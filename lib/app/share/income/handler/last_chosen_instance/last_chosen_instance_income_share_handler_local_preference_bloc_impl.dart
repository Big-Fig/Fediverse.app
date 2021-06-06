import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class LastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<AuthInstance?>
    implements ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc {
  LastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'LastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc',
          schemaVersion: 1,
          jsonConverter: AuthInstance.fromJson,
        );

  @override
  AuthInstance? get defaultPreferenceValue => null;
}
