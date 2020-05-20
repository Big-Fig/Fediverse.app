import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

final defaultIsRealtimeWebSocketsEnabled = true;
final defaultIsNewChatsEnabled = false;

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
  bool get isNewChatsEnabled =>
      localPreferenceBloc.value?.isNewChatsEnabled ??
          defaultIsNewChatsEnabled;

  @override
  Stream<bool> get isNewChatsEnabledStream =>
      localPreferenceBloc.stream.map((value) =>
          value?.isNewChatsEnabled ??
              defaultIsNewChatsEnabled);

  @override
  void changeIsRealtimeWebSocketsEnabled(bool value) {
    localPreferenceBloc.setValue(
        localPreferenceBloc.value.copyWith(isRealtimeWebSocketsEnabled: value));
  }  @override
  void changeIsNewChatsEnabled(bool value) {
    localPreferenceBloc.setValue(
        localPreferenceBloc.value.copyWith(isNewChatsEnabled: value));
  }
}
