import 'dart:async';

import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'web_sockets_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalWebSocketsSettingsLocalPreferenceBloc
      globalWebSocketsSettingsLocalPreferencesBloc;
  late InstanceWebSocketsSettingsLocalPreferenceBloc
      instanceWebSocketsSettingsLocalPreferencesBloc;
  late WebSocketsSettingsBloc webSocketsSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  WebSocketsSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalWebSocketsSettingsLocalPreferencesBloc =
        GlobalWebSocketsSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalWebSocketsSettingsLocalPreferencesBloc.performAsyncInit();

    instanceWebSocketsSettingsLocalPreferencesBloc =
        InstanceWebSocketsSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceWebSocketsSettingsLocalPreferencesBloc.performAsyncInit();
    webSocketsSettingsBloc = WebSocketsSettingsBloc(
      globalLocalPreferencesBloc: globalWebSocketsSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc:
          instanceWebSocketsSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        webSocketsSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await webSocketsSettingsBloc.dispose();
    await globalWebSocketsSettingsLocalPreferencesBloc.dispose();
    await instanceWebSocketsSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('handlingType', () async {
    WebSocketsHandlingType? listenedHandlingType;

    StreamSubscription subscriptionListenedWebSocketsAgeLimitType =
        webSocketsSettingsBloc.handlingTypeStream.listen(
      (data) {
        listenedHandlingType = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalWebSocketsSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.handlingType,
      defaultValue.handlingType,
    );
    expect(
      webSocketsSettingsBloc.settingsData.handlingType,
      defaultValue.handlingType,
    );

    expect(
      listenedHandlingType,
      defaultValue.handlingType,
    );
    expect(
      webSocketsSettingsBloc.handlingType,
      defaultValue.handlingType,
    );

    var testHandlingType =
        WebSocketsSettingsModelTestHelper.createTestWebSocketsSettings(
      seed: 'seed',
    ).handlingType;

    await webSocketsSettingsBloc.changeHandlingType(testHandlingType);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.handlingType,
      testHandlingType,
    );
    expect(
      webSocketsSettingsBloc.settingsData.handlingType,
      testHandlingType,
    );

    expect(
      listenedHandlingType,
      testHandlingType,
    );
    expect(
      webSocketsSettingsBloc.handlingType,
      testHandlingType,
    );

    await subscriptionListenedWebSocketsAgeLimitType.cancel();
  });
}
