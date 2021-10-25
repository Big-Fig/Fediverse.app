import 'package:fedi_app/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi_app/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_model.dart';

// ignore_for_file: no-magic-number
class FilesCacheSettingsModelMockHelper {
  static FilesCacheSettings createTestFilesCacheSettings({
    required String seed,
  }) =>
      FilesCacheSettings.fromEnum(
        sizeLimitCountType: FilesCacheSizeLimitCountType
            .values[seed.hashCode % FilesCacheSizeLimitCountType.values.length],
        ageLimitType: FilesCacheAgeLimitType
            .values[seed.hashCode % FilesCacheAgeLimitType.values.length],
      );
}
