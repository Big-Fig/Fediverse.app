import 'dart:async';

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'toast_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
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

    await Future.delayed(Duration(milliseconds: 100));

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
        ToastSettingsModelTestHelper.createTestToastSettings(seed: "seed")
            .pushSettings;

    await toastSettingsBloc.changePushSettings(testPushSettings);
    await Future.delayed(Duration(milliseconds: 100));

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

    await Future.delayed(Duration(milliseconds: 100));

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
        ToastSettingsModelTestHelper.createTestToastSettings(seed: "seed")
            .handlingType;

    await toastSettingsBloc.changeHandlingType(testHandlingType);
    await Future.delayed(Duration(milliseconds: 100));

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

    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
  test('changePleromaEmojiReaction', () async {
    bool? listenedPleromaEmojiReaction;

    StreamSubscription subscriptionListenedPleromaEmojiReaction =
        toastSettingsBloc.pleromaEmojiReactionStream.listen(
      (data) {
        listenedPleromaEmojiReaction = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.pleromaEmojiReaction,
      defaultValue.pushSettings.pleromaEmojiReaction,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.pleromaEmojiReaction,
      defaultValue.pushSettings.pleromaEmojiReaction,
    );

    expect(
      listenedPleromaEmojiReaction,
      defaultValue.pushSettings.pleromaEmojiReaction,
    );
    expect(
      toastSettingsBloc.pleromaEmojiReaction,
      defaultValue.pushSettings.pleromaEmojiReaction,
    );

    var testPleromaEmojiReaction = true;

    await toastSettingsBloc
        .changePleromaEmojiReaction(testPleromaEmojiReaction);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pushSettings.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    expect(
      listenedPleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      toastSettingsBloc.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    testPleromaEmojiReaction = false;

    await toastSettingsBloc
        .changePleromaEmojiReaction(testPleromaEmojiReaction);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pushSettings.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    expect(
      listenedPleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      toastSettingsBloc.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    await subscriptionListenedPleromaEmojiReaction.cancel();
  });
  test('changePleromaChatMention', () async {
    bool? listenedPleromaChatMention;

    StreamSubscription subscriptionListenedPleromaChatMention =
        toastSettingsBloc.pleromaChatMentionStream.listen(
      (data) {
        listenedPleromaChatMention = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalToastSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pushSettings.pleromaChatMention,
      defaultValue.pushSettings.pleromaChatMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.pleromaChatMention,
      defaultValue.pushSettings.pleromaChatMention,
    );

    expect(
      listenedPleromaChatMention,
      defaultValue.pushSettings.pleromaChatMention,
    );
    expect(
      toastSettingsBloc.pleromaChatMention,
      defaultValue.pushSettings.pleromaChatMention,
    );

    var testPleromaChatMention = true;

    await toastSettingsBloc.changePleromaChatMention(testPleromaChatMention);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pushSettings.pleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.pleromaChatMention,
      testPleromaChatMention,
    );

    expect(
      listenedPleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      toastSettingsBloc.pleromaChatMention,
      testPleromaChatMention,
    );

    testPleromaChatMention = false;

    await toastSettingsBloc.changePleromaChatMention(testPleromaChatMention);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pushSettings.pleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      toastSettingsBloc.settingsData.pushSettings.pleromaChatMention,
      testPleromaChatMention,
    );

    expect(
      listenedPleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      toastSettingsBloc.pleromaChatMention,
      testPleromaChatMention,
    );

    await subscriptionListenedPleromaChatMention.cancel();
  });
  test('changePoll', () async {
    bool? listenedPoll;

    StreamSubscription subscriptionListenedPoll =
        toastSettingsBloc.pollStream.listen(
      (data) {
        listenedPoll = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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

    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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

    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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

    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
    await Future.delayed(Duration(milliseconds: 100));

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
