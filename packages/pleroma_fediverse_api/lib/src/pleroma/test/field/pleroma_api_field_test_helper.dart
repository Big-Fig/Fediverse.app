import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class PleromaApiFieldTestHelper {
  static PleromaApiField createTestPleromaApiField({
    required String seed,
  }) =>
      PleromaApiField(
        name: seed + 'name',
        value: seed + 'value',
        // ignore: no-magic-number
        verifiedAt: DateTime(seed.hashCode % 2000),
      );
}
