import 'dart:async';

import 'package:fedi_app/app/chat/settings/chat_settings_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../rxdart/rxdart_test_helper.dart';
import 'chat_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalChatSettingsLocalPreferenceBloc
      globalChatSettingsLocalPreferencesBloc;
  late InstanceChatSettingsLocalPreferenceBloc
      instanceChatSettingsLocalPreferencesBloc;
  late ChatSettingsBloc chatSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  ChatSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalChatSettingsLocalPreferencesBloc =
        GlobalChatSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalChatSettingsLocalPreferencesBloc.performAsyncInit();

    instanceChatSettingsLocalPreferencesBloc =
        InstanceChatSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceChatSettingsLocalPreferencesBloc.performAsyncInit();
    chatSettingsBloc = ChatSettingsBloc(
      globalLocalPreferencesBloc: globalChatSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc: instanceChatSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        chatSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await chatSettingsBloc.dispose();
    await globalChatSettingsLocalPreferencesBloc.dispose();
    await instanceChatSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('countConversationsInChatsUnreadBadges', () async {
    bool? listened;

    StreamSubscription subscriptionListenedChatAgeLimitType =
        chatSettingsBloc.countConversationsInChatsUnreadBadgesStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalChatSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.countConversationsInChatsUnreadBadges,
      defaultValue.countConversationsInChatsUnreadBadges,
    );
    expect(
      chatSettingsBloc.settingsData.countConversationsInChatsUnreadBadges,
      defaultValue.countConversationsInChatsUnreadBadges,
    );

    expect(
      listened,
      defaultValue.countConversationsInChatsUnreadBadges,
    );
    expect(
      chatSettingsBloc.countConversationsInChatsUnreadBadges,
      defaultValue.countConversationsInChatsUnreadBadges,
    );

    var testCountConversationsInChatsUnreadBadges =
        ChatSettingsModelMockHelper.createTestChatSettings(seed: 'seed')
            .countConversationsInChatsUnreadBadges;

    await chatSettingsBloc.changeCountConversationsInChatsUnreadBadges(
      appendConversationUnreadToUnreadBadge:
          testCountConversationsInChatsUnreadBadges,
    );

    expect(
      listenedSettingsData?.countConversationsInChatsUnreadBadges,
      testCountConversationsInChatsUnreadBadges,
    );
    expect(
      chatSettingsBloc.settingsData.countConversationsInChatsUnreadBadges,
      testCountConversationsInChatsUnreadBadges,
    );

    expect(
      listened,
      testCountConversationsInChatsUnreadBadges,
    );
    expect(
      chatSettingsBloc.countConversationsInChatsUnreadBadges,
      testCountConversationsInChatsUnreadBadges,
    );

    await subscriptionListenedChatAgeLimitType.cancel();
  });
  test('replaceConversationsWithUnifediChats', () async {
    bool? listened;

    StreamSubscription subscriptionListenedChatAgeLimitType =
        chatSettingsBloc.replaceConversationsWithUnifediChatsStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalChatSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.replaceConversationsWithUnifediChats,
      defaultValue.replaceConversationsWithUnifediChats,
    );
    expect(
      chatSettingsBloc.settingsData.replaceConversationsWithUnifediChats,
      defaultValue.replaceConversationsWithUnifediChats,
    );

    expect(
      listened,
      defaultValue.replaceConversationsWithUnifediChats,
    );
    expect(
      chatSettingsBloc.replaceConversationsWithUnifediChats,
      defaultValue.replaceConversationsWithUnifediChats,
    );

    var testCountConversationsInChatsUnreadBadges =
        ChatSettingsModelMockHelper.createTestChatSettings(seed: 'seed')
            .replaceConversationsWithUnifediChats;

    await chatSettingsBloc.changeReplaceConversationsWithUnifediChats(
      replaceConversationsWithChats: testCountConversationsInChatsUnreadBadges,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listenedSettingsData?.replaceConversationsWithUnifediChats,
      testCountConversationsInChatsUnreadBadges,
    );
    expect(
      chatSettingsBloc.settingsData.replaceConversationsWithUnifediChats,
      testCountConversationsInChatsUnreadBadges,
    );

    expect(
      listened,
      testCountConversationsInChatsUnreadBadges,
    );
    expect(
      chatSettingsBloc.replaceConversationsWithUnifediChats,
      testCountConversationsInChatsUnreadBadges,
    );

    await subscriptionListenedChatAgeLimitType.cancel();
  });
}
