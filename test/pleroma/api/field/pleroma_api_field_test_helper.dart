import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';

class PleromaApiFieldTestHelper {
  static PleromaApiField createTestPleromaApiField({
    required String seed,
  }) =>
      PleromaApiField(
        name: seed + "name",
        value: seed + "value",
        // ignore: no-magic-number
        verifiedAt: DateTime(seed.hashCode % 2000),
      );
}
