import 'package:fedi/app/push/notification/simple/handler/unhandled/local_preferences/simple_notifications_push_handler_unhandled_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/notification/simple/handler/unhandled/simple_notifications_push_handler_unhandled_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../simple_notifications_push_handler_unhandled_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<
        SimpleNotificationsPushHandlerUnhandledList,
        SimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc>(
      defaultValue: SimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc
          .defaultValue,
      blocCreator: (localPreferencesService) =>
          SimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          SimpleNotificationsPushHandlerUnhandledModelTestHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });
}
