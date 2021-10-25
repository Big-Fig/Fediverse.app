// ignore_for_file: unnecessary_lambdas
// ignore_for_file: avoid-ignoring-return-values
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi_app/app/timeline/timeline_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';
import '../timeline_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    var timelineId = 'timelineId';
    var defaultPreferenceValue = Timeline(
      typeString: TimelineType.public.toJsonValue(),
      settings: TimelineSettings.createDefaultHomeSettings(),
      id: timelineId,
      label: 'label',
      isPossibleToDelete: false,
    );
    await LocalPreferencesMockHelper.testSaveAndLoad<Timeline,
        TimelineLocalPreferenceBloc>(
      defaultValue: defaultPreferenceValue,
      blocCreator: (localPreferencesService) =>
          TimelineLocalPreferenceBloc.byId(
        localPreferencesService,
        userAtHost: 'user@host',
        defaultPreferenceValue: defaultPreferenceValue,
        timelineId: timelineId,
      ),
      testObjectCreator: ({required String seed}) =>
          TimelineModelMockHelper.createTestTimeline(
        seed: seed,
      ),
    );
  });
}
