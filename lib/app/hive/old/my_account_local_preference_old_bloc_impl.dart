import 'package:fedi/app/hive/old/my_account_local_preference_old_bloc.dart';
import 'package:fedi/app/hive/old/my_account_old_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class MyAccountLocalPreferenceBlocOld
    extends ObjectLocalPreferenceBloc<PleromaMyAccountWrapperOld?>
    implements IMyAccountLocalPreferenceBlocOld {
  static const PleromaMyAccountWrapperOld? defaultValue = null;

  MyAccountLocalPreferenceBlocOld(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: 'account.my.$userAtHost',
          schemaVersion: 1,
          jsonConverter: (json) => PleromaMyAccountWrapperOld.fromJson(json),
        );

  @override
  PleromaMyAccountWrapperOld? get defaultPreferenceValue => defaultValue;
}
