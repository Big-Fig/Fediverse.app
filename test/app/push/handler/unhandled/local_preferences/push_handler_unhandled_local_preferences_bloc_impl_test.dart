import 'package:fedi/app/push/handler/unhandled/local_preferences/push_handler_unhandled_local_preferences_bloc_impl.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../push_handler_unhandled_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<PushHandlerUnhandledList,
        PushHandlerUnhandledLocalPreferencesBloc>(
      defaultValue: PushHandlerUnhandledLocalPreferencesBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          PushHandlerUnhandledLocalPreferencesBloc(localPreferencesService),
      testObjectCreator: ({required String seed}) =>
          PushHandlerUnhandledModelTestHelper
              .createTestPushHandlerUnhandledList(
        seed: seed,
      ),
    );
  });
}
