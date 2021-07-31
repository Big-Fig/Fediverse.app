// ignore_for_file: no-magic-number
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiVisibilityTestHelper {
  static PleromaApiVisibility createTestPleromaApiVisibility({
    required String seed,
  }) =>
      PleromaApiVisibility
          .values[seed.hashCode % PleromaApiVisibility.values.length];
}
