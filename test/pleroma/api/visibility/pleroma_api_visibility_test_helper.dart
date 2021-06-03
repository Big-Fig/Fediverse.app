// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';

class PleromaApiVisibilityTestHelper {
  static PleromaApiVisibility createTestPleromaApiVisibility({
    required String seed,
  }) =>
      PleromaApiVisibility
          .values[seed.hashCode % PleromaApiVisibility.values.length];
}
