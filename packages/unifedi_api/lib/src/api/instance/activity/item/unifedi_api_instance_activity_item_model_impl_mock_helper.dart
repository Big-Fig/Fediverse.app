// ignore_for_file: no-magic-number, no-equal-arguments
import 'unifedi_api_instance_activity_item_model_impl.dart';

class UnifediApiInstanceActivityItemMockHelper {
  static UnifediApiInstanceActivityItem generate({
    required String seed,
  }) =>
      UnifediApiInstanceActivityItem(
        logins: seed.hashCode + 'logins'.hashCode,
        registrations: seed.hashCode + 'registrations'.hashCode,
        statuses: seed.hashCode + 'statuses'.hashCode,
        week: seed.hashCode + 'week'.hashCode,
      );
}
