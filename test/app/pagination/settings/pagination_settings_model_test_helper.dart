import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';

// ignore_for_file: no-magic-number
class PaginationSettingsModelMockHelper {
  static PaginationSettings createTestPaginationSettings({
    required String seed,
  }) =>
      // hack to be sure that seed1 and seed2 wil produce different objects
      PaginationSettings.fromEnum(
        pageSize: PaginationPageSize
            .values[seed.hashCode % PaginationPageSize.values.length],
      );
}
