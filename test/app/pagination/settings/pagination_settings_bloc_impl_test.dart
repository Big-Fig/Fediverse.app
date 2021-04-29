import 'dart:async';

import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pagination_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalPaginationSettingsLocalPreferenceBloc
      globalPaginationSettingsLocalPreferencesBloc;
  late InstancePaginationSettingsLocalPreferenceBloc
      instancePaginationSettingsLocalPreferencesBloc;
  late PaginationSettingsBloc paginationSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  PaginationSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalPaginationSettingsLocalPreferencesBloc =
        GlobalPaginationSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalPaginationSettingsLocalPreferencesBloc.performAsyncInit();

    instancePaginationSettingsLocalPreferencesBloc =
        InstancePaginationSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instancePaginationSettingsLocalPreferencesBloc.performAsyncInit();
    paginationSettingsBloc = PaginationSettingsBloc(
      globalLocalPreferencesBloc: globalPaginationSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc:
          instancePaginationSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        paginationSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await paginationSettingsBloc.dispose();
    await globalPaginationSettingsLocalPreferencesBloc.dispose();
    await instancePaginationSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('pageSize', () async {
    PaginationPageSize? listenedPageSize;

    StreamSubscription subscriptionListenedPaginationAgeLimitType =
        paginationSettingsBloc.pageSizeStream.listen(
      (data) {
        listenedPageSize = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalPaginationSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.pageSize,
      defaultValue.pageSize,
    );
    expect(
      paginationSettingsBloc.settingsData.pageSize,
      defaultValue.pageSize,
    );

    expect(
      listenedPageSize,
      defaultValue.pageSize,
    );
    expect(
      paginationSettingsBloc.pageSize,
      defaultValue.pageSize,
    );

    var testPageSize =
        PaginationSettingsModelTestHelper.createTestPaginationSettings(
                seed: "seed")
            .pageSize;

    await paginationSettingsBloc.changePageSize(testPageSize);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.pageSize,
      testPageSize,
    );
    expect(
      paginationSettingsBloc.settingsData.pageSize,
      testPageSize,
    );

    expect(
      listenedPageSize,
      testPageSize,
    );
    expect(
      paginationSettingsBloc.pageSize,
      testPageSize,
    );

    await subscriptionListenedPaginationAgeLimitType.cancel();
  });
}
