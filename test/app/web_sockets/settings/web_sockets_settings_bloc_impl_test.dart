import 'dart:async';

import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../rxdart/rxdart_test_helper.dart';
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
    WebSocketsMode? listened;

    StreamSubscription subscriptionListenedWebSocketsAgeLimitType =
        webSocketsSettingsBloc.handlingTypeStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

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
      listened,
      defaultValue.handlingType,
    );
    expect(
      webSocketsSettingsBloc.handlingType,
      defaultValue.handlingType,
    );

    var testHandlingType =
        WebSocketsSettingsModelMockHelper.createTestWebSocketsSettings(
      seed: 'seed',
    ).handlingType;

    await webSocketsSettingsBloc.changeHandlingType(testHandlingType);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listenedSettingsData?.handlingType,
      testHandlingType,
    );
    expect(
      webSocketsSettingsBloc.settingsData.handlingType,
      testHandlingType,
    );

    expect(
      listened,
      testHandlingType,
    );
    expect(
      webSocketsSettingsBloc.handlingType,
      testHandlingType,
    );

    await subscriptionListenedWebSocketsAgeLimitType.cancel();
  });
}
