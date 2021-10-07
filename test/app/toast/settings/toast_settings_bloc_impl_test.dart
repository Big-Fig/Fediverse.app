import 'dart:async';

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../rxdart/rxdart_test_helper.dart';
import 'toast_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalToastSettingsLocalPreferenceBloc
      globalToastSettingsLocalPreferencesBloc;
  late InstanceToastSettingsLocalPreferenceBloc
      instanceToastSettingsLocalPreferencesBloc;
  late ToastSettingsBloc toastSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  ToastSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalToastSettingsLocalPreferencesBloc =
        GlobalToastSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalToastSettingsLocalPreferencesBloc.performAsyncInit();

    instanceToastSettingsLocalPreferencesBloc =
        InstanceToastSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceToastSettingsLocalPreferencesBloc.performAsyncInit();
    toastSettingsBloc = ToastSettingsBloc(
      globalLocalPreferencesBloc: globalToastSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc: instanceToastSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        toastSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await toastSettingsBloc.dispose();
    await globalToastSettingsLocalPreferencesBloc.dispose();
    await instanceToastSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('pushSettings', () async {
    PushSettings? listenedPushSettings;

    StreamSubscription subscriptionListenedToastAgeLimitType =
        toastSettingsBloc.pushSettingsStream.listen(
      (data) {
        listenedPushSettings = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings,
      defaultValue.pushSettings,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings,
      defaultValue.pushSettings,
    );

    expect(
      listenedPushSettings,
      defaultValue.pushSettings,
    );
    expect(
      toastSettingsBloc.pushSettings,
      defaultValue.pushSettings,
    );

    var testPushSettings =
        ToastSettingsModelMockHelper.createTestToastSettings(seed: 'seed')
            .pushSettings;

    await toastSettingsBloc.changePushSettings(testPushSettings);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings,
      testPushSettings,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings,
      testPushSettings,
    );

    expect(
      listenedPushSettings,
      testPushSettings,
    );
    expect(
      toastSettingsBloc.pushSettings,
      testPushSettings,
    );

    await subscriptionListenedToastAgeLimitType.cancel();
  });

  test('handlingType', () async {
    ToastHandlingType? listenedHandlingType;

    StreamSubscription subscriptionListenedToastAgeLimitType =
        toastSettingsBloc.handlingTypeStream.listen(
      (data) {
        listenedHandlingType = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.handlingType,
      defaultValue.handlingType,
    );
    expect(
      toastSettingsBloc.settingsData.handlingType,
      defaultValue.handlingType,
    );

    expect(
      listenedHandlingType,
      defaultValue.handlingType,
    );
    expect(
      toastSettingsBloc.handlingType,
      defaultValue.handlingType,
    );

    var testHandlingType =
        ToastSettingsModelMockHelper.createTestToastSettings(seed: 'seed')
            .handlingType;

    await toastSettingsBloc.changeHandlingType(testHandlingType);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.handlingType,
      testHandlingType,
    );
    expect(
      toastSettingsBloc.settingsData.handlingType,
      testHandlingType,
    );

    expect(
      listenedHandlingType,
      testHandlingType,
    );
    expect(
      toastSettingsBloc.handlingType,
      testHandlingType,
    );

    await subscriptionListenedToastAgeLimitType.cancel();
  });

  test('changeFollow', () async {
    bool? listenedFollow;

    StreamSubscription subscriptionListenedFollow =
        toastSettingsBloc.followStream.listen(
      (data) {
        listenedFollow = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.follow,
      defaultValue.pushSettings.follow,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.follow,
      defaultValue.pushSettings.follow,
    );

    expect(
      listenedFollow,
      defaultValue.pushSettings.follow,
    );
    expect(
      toastSettingsBloc.follow,
      defaultValue.pushSettings.follow,
    );

    var testFollow = true;

    await toastSettingsBloc.changeFollow(testFollow);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.follow,
      testFollow,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.follow,
      testFollow,
    );

    expect(
      listenedFollow,
      testFollow,
    );
    expect(
      toastSettingsBloc.follow,
      testFollow,
    );

    testFollow = false;

    await toastSettingsBloc.changeFollow(testFollow);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.follow,
      testFollow,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.follow,
      testFollow,
    );

    expect(
      listenedFollow,
      testFollow,
    );
    expect(
      toastSettingsBloc.follow,
      testFollow,
    );

    await subscriptionListenedFollow.cancel();
  });
  test('changeEmojiReaction', () async {
    bool? listenedEmojiReaction;

    StreamSubscription subscriptionListenedEmojiReaction =
        toastSettingsBloc.emojiReactionStream.listen(
      (data) {
        listenedEmojiReaction = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.emojiReaction,
      defaultValue.pushSettings.emojiReaction,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.emojiReaction,
      defaultValue.pushSettings.emojiReaction,
    );

    expect(
      listenedEmojiReaction,
      defaultValue.pushSettings.emojiReaction,
    );
    expect(
      toastSettingsBloc.emojiReaction,
      defaultValue.pushSettings.emojiReaction,
    );

    var testEmojiReaction = true;

    await toastSettingsBloc.changeEmojiReaction(testEmojiReaction);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.emojiReaction,
      testEmojiReaction,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.emojiReaction,
      testEmojiReaction,
    );

    expect(
      listenedEmojiReaction,
      testEmojiReaction,
    );
    expect(
      toastSettingsBloc.emojiReaction,
      testEmojiReaction,
    );

    testEmojiReaction = false;

    await toastSettingsBloc.changeEmojiReaction(testEmojiReaction);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.emojiReaction,
      testEmojiReaction,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.emojiReaction,
      testEmojiReaction,
    );

    expect(
      listenedEmojiReaction,
      testEmojiReaction,
    );
    expect(
      toastSettingsBloc.emojiReaction,
      testEmojiReaction,
    );

    await subscriptionListenedEmojiReaction.cancel();
  });
  test('changeChatMention', () async {
    bool? listenedChatMention;

    StreamSubscription subscriptionListenedChatMention =
        toastSettingsBloc.chatMentionStream.listen(
      (data) {
        listenedChatMention = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.chatMention,
      defaultValue.pushSettings.chatMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.chatMention,
      defaultValue.pushSettings.chatMention,
    );

    expect(
      listenedChatMention,
      defaultValue.pushSettings.chatMention,
    );
    expect(
      toastSettingsBloc.chatMention,
      defaultValue.pushSettings.chatMention,
    );

    var testChatMention = true;

    await toastSettingsBloc.changeChatMention(testChatMention);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.chatMention,
      testChatMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.chatMention,
      testChatMention,
    );

    expect(
      listenedChatMention,
      testChatMention,
    );
    expect(
      toastSettingsBloc.chatMention,
      testChatMention,
    );

    testChatMention = false;

    await toastSettingsBloc.changeChatMention(testChatMention);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.chatMention,
      testChatMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.chatMention,
      testChatMention,
    );

    expect(
      listenedChatMention,
      testChatMention,
    );
    expect(
      toastSettingsBloc.chatMention,
      testChatMention,
    );

    await subscriptionListenedChatMention.cancel();
  });
  test('changePoll', () async {
    bool? listenedPoll;

    StreamSubscription subscriptionListenedPoll =
        toastSettingsBloc.pollStream.listen(
      (data) {
        listenedPoll = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.poll,
      defaultValue.pushSettings.poll,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.poll,
      defaultValue.pushSettings.poll,
    );

    expect(
      listenedPoll,
      defaultValue.pushSettings.poll,
    );
    expect(
      toastSettingsBloc.poll,
      defaultValue.pushSettings.poll,
    );

    var testPoll = true;

    await toastSettingsBloc.changePoll(testPoll);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.poll,
      testPoll,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.poll,
      testPoll,
    );

    expect(
      listenedPoll,
      testPoll,
    );
    expect(
      toastSettingsBloc.poll,
      testPoll,
    );

    testPoll = false;

    await toastSettingsBloc.changePoll(testPoll);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.poll,
      testPoll,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.poll,
      testPoll,
    );

    expect(
      listenedPoll,
      testPoll,
    );
    expect(
      toastSettingsBloc.poll,
      testPoll,
    );

    await subscriptionListenedPoll.cancel();
  });
  test('changeMention', () async {
    bool? listenedMention;

    StreamSubscription subscriptionListenedMention =
        toastSettingsBloc.mentionStream.listen(
      (data) {
        listenedMention = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.mention,
      defaultValue.pushSettings.mention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.mention,
      defaultValue.pushSettings.mention,
    );

    expect(
      listenedMention,
      defaultValue.pushSettings.mention,
    );
    expect(
      toastSettingsBloc.mention,
      defaultValue.pushSettings.mention,
    );

    var testMention = true;

    await toastSettingsBloc.changeMention(testMention);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.mention,
      testMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.mention,
      testMention,
    );

    expect(
      listenedMention,
      testMention,
    );
    expect(
      toastSettingsBloc.mention,
      testMention,
    );

    testMention = false;

    await toastSettingsBloc.changeMention(testMention);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.mention,
      testMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.mention,
      testMention,
    );

    expect(
      listenedMention,
      testMention,
    );
    expect(
      toastSettingsBloc.mention,
      testMention,
    );

    await subscriptionListenedMention.cancel();
  });

  test('changeFavourite', () async {
    bool? listenedFavourite;

    StreamSubscription subscriptionListenedFavourite =
        toastSettingsBloc.favouriteStream.listen(
      (data) {
        listenedFavourite = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.favourite,
      defaultValue.pushSettings.favourite,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.favourite,
      defaultValue.pushSettings.favourite,
    );

    expect(
      listenedFavourite,
      defaultValue.pushSettings.favourite,
    );
    expect(
      toastSettingsBloc.favourite,
      defaultValue.pushSettings.favourite,
    );

    var testFavourite = true;

    await toastSettingsBloc.changeFavourite(testFavourite);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.favourite,
      testFavourite,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.favourite,
      testFavourite,
    );

    expect(
      listenedFavourite,
      testFavourite,
    );
    expect(
      toastSettingsBloc.favourite,
      testFavourite,
    );

    testFavourite = false;

    await toastSettingsBloc.changeFavourite(testFavourite);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.favourite,
      testFavourite,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.favourite,
      testFavourite,
    );

    expect(
      listenedFavourite,
      testFavourite,
    );
    expect(
      toastSettingsBloc.favourite,
      testFavourite,
    );

    await subscriptionListenedFavourite.cancel();
  });

  test('changeReblog', () async {
    bool? listenedReblog;

    StreamSubscription subscriptionListenedReblog =
        toastSettingsBloc.reblogStream.listen(
      (data) {
        listenedReblog = data;
      },
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.reblog,
      defaultValue.pushSettings.reblog,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.reblog,
      defaultValue.pushSettings.reblog,
    );

    expect(
      listenedReblog,
      defaultValue.pushSettings.reblog,
    );
    expect(
      toastSettingsBloc.reblog,
      defaultValue.pushSettings.reblog,
    );

    var testReblog = true;

    await toastSettingsBloc.changeReblog(testReblog);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.reblog,
      testReblog,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.reblog,
      testReblog,
    );

    expect(
      listenedReblog,
      testReblog,
    );
    expect(
      toastSettingsBloc.reblog,
      testReblog,
    );

    testReblog = false;

    await toastSettingsBloc.changeReblog(testReblog);
    await RxDartMockHelper.waitToExecuteRxCallbacks();

    expect(
      listenedSettingsData?.pushSettings.reblog,
      testReblog,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.reblog,
      testReblog,
    );

    expect(
      listenedReblog,
      testReblog,
    );
    expect(
      toastSettingsBloc.reblog,
      testReblog,
    );

    await subscriptionListenedReblog.cancel();
  });
}
