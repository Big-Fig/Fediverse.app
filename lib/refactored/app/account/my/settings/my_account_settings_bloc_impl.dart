import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

final defaultIsRealtimeWebSocketsEnabled = true;

class MyAccountSettingsBloc extends DisposableOwner
    implements IMyAccountSettingsBloc {
  final IMyAccountSettingsLocalPreferenceBloc localPreferenceBloc;

  MyAccountSettingsBloc({@required this.localPreferenceBloc});

  @override
  bool get isRealtimeWebSocketsEnabled =>
      localPreferenceBloc.value?.isRealtimeWebSocketsEnabled ??
      defaultIsRealtimeWebSocketsEnabled;

  @override
  Stream<bool> get isRealtimeWebSocketsEnabledStream =>
      localPreferenceBloc.stream.map((value) =>
          value?.isRealtimeWebSocketsEnabled ??
          defaultIsRealtimeWebSocketsEnabled);

  @override
  changeIsRealtimeWebSocketsEnabled(bool value) {
    localPreferenceBloc.setValue(localPreferenceBloc.value.copyWith
      (isRealtimeWebSocketsEnabled:value));
  }
}
