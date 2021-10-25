// ignore_for_file: no-magic-number, no-equal-arguments
import 'pleroma_api_instance_activity_item_model_impl.dart';

class PleromaApiInstanceActivityItemMockHelper {
  static PleromaApiInstanceActivityItem generate({
    required String seed,
  }) =>
      PleromaApiInstanceActivityItem(
        logins: seed.hashCode + 'logins'.hashCode,
        registrations: seed.hashCode + 'registrations'.hashCode,
        statuses: seed.hashCode + 'statuses'.hashCode,
        week: seed.hashCode + 'week'.hashCode,
      );
}
