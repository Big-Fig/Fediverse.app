import 'dart:async';

import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_model.dart';
import 'package:fedi/pleroma/api/push/pleroma_api_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './push_settings_bloc_impl_test.mocks.dart';
import '../../auth/instance/auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number
@GenerateMocks([
  IPleromaApiPushService,
  IPushRelayService,
  IFcmPushService,
])
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late InstancePushSettingsLocalPreferenceBloc
      instancePushSettingsLocalPreferencesBloc;
  late PushSettingsBloc pushSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  PushSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    instancePushSettingsLocalPreferencesBloc =
        InstancePushSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instancePushSettingsLocalPreferencesBloc.performAsyncInit();

    var fcmPushService = MockIFcmPushService();
    var pleromaPushService = MockIPleromaApiPushService();
    var pushRelayService = MockIPushRelayService();

    when(fcmPushService.deviceToken).thenReturn('testDeviceToken');
    when(pushRelayService.createPushRelayEndPointUrl(
      account: anyNamed('account'),
      baseServerUrl: anyNamed('baseServerUrl'),
      fcmDeviceToken: anyNamed('fcmDeviceToken'),
    )).thenReturn('testUrl');
    when(fcmPushService.askPermissions()).thenAnswer((_) async => true);
    when(pleromaPushService.subscribe(
      endpointCallbackUrl: anyNamed('endpointCallbackUrl'),
      data: anyNamed('data'),
    )).thenAnswer((invocation) async {
      return PleromaApiPushSubscription(
        alerts: (invocation.namedArguments[Symbol('data')]
                as PleromaApiPushSubscribeData)
            .alerts!,
        endpoint: 'endpoint',
        serverKey: 'serverKey',
        id: null,
        subscription: null,
      );
    });

    pushSettingsBloc = PushSettingsBloc(
      instanceLocalPreferencesBloc: instancePushSettingsLocalPreferencesBloc,
      pleromaPushService: pleromaPushService,
      pushRelayService: pushRelayService,
      fcmPushService: fcmPushService,
      currentInstance: AuthInstanceModelTestHelper.createTestAuthInstance(
        seed: 'seed',
      ),
    );

    subscriptionListenedSettingsData =
        pushSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await pushSettingsBloc.dispose();
    await instancePushSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('changeFollow', () async {
    bool? listenedFollow;

    StreamSubscription subscriptionListenedFollow =
        pushSettingsBloc.followStream.listen(
      (data) {
        listenedFollow = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.follow,
      defaultValue.follow,
    );
    expect(
      pushSettingsBloc.settingsData.follow,
      defaultValue.follow,
    );

    expect(
      listenedFollow,
      defaultValue.follow,
    );
    expect(
      pushSettingsBloc.follow,
      defaultValue.follow,
    );

    var testFollow = true;

    await pushSettingsBloc.changeFollow(testFollow);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.follow,
      testFollow,
    );
    expect(
      pushSettingsBloc.settingsData.follow,
      testFollow,
    );

    expect(
      listenedFollow,
      testFollow,
    );
    expect(
      pushSettingsBloc.follow,
      testFollow,
    );

    testFollow = false;

    await pushSettingsBloc.changeFollow(testFollow);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.follow,
      testFollow,
    );
    expect(
      pushSettingsBloc.settingsData.follow,
      testFollow,
    );

    expect(
      listenedFollow,
      testFollow,
    );
    expect(
      pushSettingsBloc.follow,
      testFollow,
    );

    await subscriptionListenedFollow.cancel();
  });
  test('changePleromaEmojiReaction', () async {
    bool? listenedPleromaEmojiReaction;

    StreamSubscription subscriptionListenedPleromaEmojiReaction =
        pushSettingsBloc.pleromaEmojiReactionStream.listen(
      (data) {
        listenedPleromaEmojiReaction = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pleromaEmojiReaction,
      defaultValue.pleromaEmojiReaction,
    );
    expect(
      pushSettingsBloc.settingsData.pleromaEmojiReaction,
      defaultValue.pleromaEmojiReaction,
    );

    expect(
      listenedPleromaEmojiReaction,
      defaultValue.pleromaEmojiReaction,
    );
    expect(
      pushSettingsBloc.pleromaEmojiReaction,
      defaultValue.pleromaEmojiReaction,
    );

    var testPleromaEmojiReaction = true;

    await pushSettingsBloc.changePleromaEmojiReaction(testPleromaEmojiReaction);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      pushSettingsBloc.settingsData.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    expect(
      listenedPleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      pushSettingsBloc.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    testPleromaEmojiReaction = false;

    await pushSettingsBloc.changePleromaEmojiReaction(testPleromaEmojiReaction);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      pushSettingsBloc.settingsData.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    expect(
      listenedPleromaEmojiReaction,
      testPleromaEmojiReaction,
    );
    expect(
      pushSettingsBloc.pleromaEmojiReaction,
      testPleromaEmojiReaction,
    );

    await subscriptionListenedPleromaEmojiReaction.cancel();
  });
  test('changePleromaChatMention', () async {
    bool? listenedPleromaChatMention;

    StreamSubscription subscriptionListenedPleromaChatMention =
        pushSettingsBloc.pleromaChatMentionStream.listen(
      (data) {
        listenedPleromaChatMention = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pleromaChatMention,
      defaultValue.pleromaChatMention,
    );
    expect(
      pushSettingsBloc.settingsData.pleromaChatMention,
      defaultValue.pleromaChatMention,
    );

    expect(
      listenedPleromaChatMention,
      defaultValue.pleromaChatMention,
    );
    expect(
      pushSettingsBloc.pleromaChatMention,
      defaultValue.pleromaChatMention,
    );

    var testPleromaChatMention = true;

    await pushSettingsBloc.changePleromaChatMention(testPleromaChatMention);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      pushSettingsBloc.settingsData.pleromaChatMention,
      testPleromaChatMention,
    );

    expect(
      listenedPleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      pushSettingsBloc.pleromaChatMention,
      testPleromaChatMention,
    );

    testPleromaChatMention = false;

    await pushSettingsBloc.changePleromaChatMention(testPleromaChatMention);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      pushSettingsBloc.settingsData.pleromaChatMention,
      testPleromaChatMention,
    );

    expect(
      listenedPleromaChatMention,
      testPleromaChatMention,
    );
    expect(
      pushSettingsBloc.pleromaChatMention,
      testPleromaChatMention,
    );

    await subscriptionListenedPleromaChatMention.cancel();
  });
  test('changePoll', () async {
    bool? listenedPoll;

    StreamSubscription subscriptionListenedPoll =
        pushSettingsBloc.pollStream.listen(
      (data) {
        listenedPoll = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.poll,
      defaultValue.poll,
    );
    expect(
      pushSettingsBloc.settingsData.poll,
      defaultValue.poll,
    );

    expect(
      listenedPoll,
      defaultValue.poll,
    );
    expect(
      pushSettingsBloc.poll,
      defaultValue.poll,
    );

    var testPoll = true;

    await pushSettingsBloc.changePoll(testPoll);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.poll,
      testPoll,
    );
    expect(
      pushSettingsBloc.settingsData.poll,
      testPoll,
    );

    expect(
      listenedPoll,
      testPoll,
    );
    expect(
      pushSettingsBloc.poll,
      testPoll,
    );

    testPoll = false;

    await pushSettingsBloc.changePoll(testPoll);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.poll,
      testPoll,
    );
    expect(
      pushSettingsBloc.settingsData.poll,
      testPoll,
    );

    expect(
      listenedPoll,
      testPoll,
    );
    expect(
      pushSettingsBloc.poll,
      testPoll,
    );

    await subscriptionListenedPoll.cancel();
  });
  test('changeMention', () async {
    bool? listenedMention;

    StreamSubscription subscriptionListenedMention =
        pushSettingsBloc.mentionStream.listen(
      (data) {
        listenedMention = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.mention,
      defaultValue.mention,
    );
    expect(
      pushSettingsBloc.settingsData.mention,
      defaultValue.mention,
    );

    expect(
      listenedMention,
      defaultValue.mention,
    );
    expect(
      pushSettingsBloc.mention,
      defaultValue.mention,
    );

    var testMention = true;

    await pushSettingsBloc.changeMention(testMention);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.mention,
      testMention,
    );
    expect(
      pushSettingsBloc.settingsData.mention,
      testMention,
    );

    expect(
      listenedMention,
      testMention,
    );
    expect(
      pushSettingsBloc.mention,
      testMention,
    );

    testMention = false;

    await pushSettingsBloc.changeMention(testMention);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.mention,
      testMention,
    );
    expect(
      pushSettingsBloc.settingsData.mention,
      testMention,
    );

    expect(
      listenedMention,
      testMention,
    );
    expect(
      pushSettingsBloc.mention,
      testMention,
    );

    await subscriptionListenedMention.cancel();
  });

  test('changeFavourite', () async {
    bool? listenedFavourite;

    StreamSubscription subscriptionListenedFavourite =
        pushSettingsBloc.favouriteStream.listen(
      (data) {
        listenedFavourite = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.favourite,
      defaultValue.favourite,
    );
    expect(
      pushSettingsBloc.settingsData.favourite,
      defaultValue.favourite,
    );

    expect(
      listenedFavourite,
      defaultValue.favourite,
    );
    expect(
      pushSettingsBloc.favourite,
      defaultValue.favourite,
    );

    var testFavourite = true;

    await pushSettingsBloc.changeFavourite(testFavourite);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.favourite,
      testFavourite,
    );
    expect(
      pushSettingsBloc.settingsData.favourite,
      testFavourite,
    );

    expect(
      listenedFavourite,
      testFavourite,
    );
    expect(
      pushSettingsBloc.favourite,
      testFavourite,
    );

    testFavourite = false;

    await pushSettingsBloc.changeFavourite(testFavourite);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.favourite,
      testFavourite,
    );
    expect(
      pushSettingsBloc.settingsData.favourite,
      testFavourite,
    );

    expect(
      listenedFavourite,
      testFavourite,
    );
    expect(
      pushSettingsBloc.favourite,
      testFavourite,
    );

    await subscriptionListenedFavourite.cancel();
  });

  test('changeReblog', () async {
    bool? listenedReblog;

    StreamSubscription subscriptionListenedReblog =
        pushSettingsBloc.reblogStream.listen(
      (data) {
        listenedReblog = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = InstancePushSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.reblog,
      defaultValue.reblog,
    );
    expect(
      pushSettingsBloc.settingsData.reblog,
      defaultValue.reblog,
    );

    expect(
      listenedReblog,
      defaultValue.reblog,
    );
    expect(
      pushSettingsBloc.reblog,
      defaultValue.reblog,
    );

    var testReblog = true;

    await pushSettingsBloc.changeReblog(testReblog);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.reblog,
      testReblog,
    );
    expect(
      pushSettingsBloc.settingsData.reblog,
      testReblog,
    );

    expect(
      listenedReblog,
      testReblog,
    );
    expect(
      pushSettingsBloc.reblog,
      testReblog,
    );

    testReblog = false;

    await pushSettingsBloc.changeReblog(testReblog);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.reblog,
      testReblog,
    );
    expect(
      pushSettingsBloc.settingsData.reblog,
      testReblog,
    );

    expect(
      listenedReblog,
      testReblog,
    );
    expect(
      pushSettingsBloc.reblog,
      testReblog,
    );

    await subscriptionListenedReblog.cancel();
  });
}
