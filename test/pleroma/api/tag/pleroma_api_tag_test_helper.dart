import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';

class PleromaApiTagTestHelper {
  static PleromaApiTag createTestPleromaApiTag({
    required String name,
  }) {
    return PleromaApiTag.only(
      name: name,
      url: "https://fedi.app/#$name",
    );
  }
}
