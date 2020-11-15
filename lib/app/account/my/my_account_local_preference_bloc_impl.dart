import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class MyAccountLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<MyAccountRemoteWrapper>
    implements IMyAccountLocalPreferenceBloc {
  MyAccountLocalPreferenceBloc(
      ILocalPreferencesService preferencesService, {
        @required String userAtHost,
      })
      : super(
          preferencesService,
          "account.my.$userAtHost",
          1,
          (json) => MyAccountRemoteWrapper.fromJson(json),
        );
}
