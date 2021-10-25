// ignore_for_file: no-magic-number, no-equal-arguments

import 'unifedi_api_instance_chat_limits_model_impl.dart';

class UnifediApiInstanceChatLimitsMockHelper {
  static UnifediApiInstanceChatLimits generate({
    required String seed,
  }) =>
      UnifediApiInstanceChatLimits(
        messageLimit: seed.hashCode + 1,
      );
}
