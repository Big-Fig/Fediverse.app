// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../notifications_push_handler_unhandled_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<
        NotificationsPushHandlerUnhandledList,
        NotificationsPushHandlerUnhandledLocalPreferenceBloc>(
      defaultValue:
          NotificationsPushHandlerUnhandledLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          NotificationsPushHandlerUnhandledLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          NotificationsPushHandlerUnhandledModelMockHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });
}
