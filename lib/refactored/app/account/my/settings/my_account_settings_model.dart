import 'package:fedi/refactored/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'my_account_settings_model.g.dart';

@HiveType()
class MyAccountSettings implements IPreferencesObject {
  @HiveField(0)
  bool isRealtimeWebSocketsEnabled;

  MyAccountSettings({this.isRealtimeWebSocketsEnabled});

  MyAccountSettings copyWith({bool isRealtimeWebSocketsEnabled}) =>
      MyAccountSettings(
          isRealtimeWebSocketsEnabled:
              isRealtimeWebSocketsEnabled ?? this.isRealtimeWebSocketsEnabled);
}
