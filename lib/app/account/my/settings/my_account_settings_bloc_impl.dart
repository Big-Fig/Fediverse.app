import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

final defaultIsRealtimeWebSocketsEnabled = true;
final defaultIsNewChatsEnabled = true;

class MyAccountSettingsBloc extends DisposableOwner
    implements IMyAccountSettingsBloc {
  final IMyAccountSettingsLocalPreferenceBloc localPreferencesBloc;
  @override
  final FormBoolFieldBloc isRealtimeWebSocketsEnabledFieldBloc;

  @override
  final FormBoolFieldBloc isNewChatsEnabledFieldBloc;

  MyAccountSettingsBloc({@required this.localPreferencesBloc})
      : isRealtimeWebSocketsEnabledFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.isRealtimeWebSocketsEnabled ??
                    defaultIsRealtimeWebSocketsEnabled),
        isNewChatsEnabledFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.isNewChatsEnabled ??
                defaultIsNewChatsEnabled) {
    addDisposable(disposable: isRealtimeWebSocketsEnabledFieldBloc);
    addDisposable(disposable: isNewChatsEnabledFieldBloc);

    addDisposable(streamSubscription:
        isRealtimeWebSocketsEnabledFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        isNewChatsEnabledFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
  }

  void _onSomethingChanged() {
    var oldPreferences = localPreferencesBloc.value;
    var newPreferences = MyAccountSettings(
      isRealtimeWebSocketsEnabled:
          isRealtimeWebSocketsEnabledFieldBloc.currentValue,
      isNewChatsEnabled: isNewChatsEnabledFieldBloc.currentValue,
    );
    if (newPreferences != oldPreferences) {
      localPreferencesBloc.setValue(newPreferences);
    }
  }
}
