import 'package:fedi/refactored/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class MyAccountLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<MyAccountRemoteWrapper>
    implements IMyAccountLocalPreferenceBloc {
  MyAccountLocalPreferenceBloc(
      ILocalPreferencesService preferencesService, String acctAtHost)
      : super(preferencesService, "account.my.$acctAtHost", 1);
}
