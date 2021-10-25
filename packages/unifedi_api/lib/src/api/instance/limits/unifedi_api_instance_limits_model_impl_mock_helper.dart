// ignore_for_file: no-magic-number, no-equal-arguments
import 'chat/unifedi_api_instance_chat_limits_model_impl_mock_helper.dart';
import 'field/unifedi_api_instance_field_limits_model_impl_mock_helper.dart';
import 'media/unifedi_api_instance_media_limits_model_impl_mock_helper.dart';
import 'poll/unifedi_api_instance_poll_limits_model_impl_mock_helper.dart';
import 'status/unifedi_api_instance_status_limits_model_impl_mock_helper.dart';
import 'unifedi_api_instance_limits_model_impl.dart';

class UnifediApiInstanceLimitsMockHelper {
  static UnifediApiInstanceLimits generate({
    required String seed,
  }) =>
      UnifediApiInstanceLimits(
        poll: UnifediApiInstancePollLimitsMockHelper.generate(
          seed: seed + 'poll',
        ),
        field: UnifediApiInstanceFieldLimitsMockHelper.generate(
          seed: seed + 'field',
        ),
        media: UnifediApiInstanceMediaLimitsMockHelper.generate(
          seed: seed + 'media',
        ),
        chat: UnifediApiInstanceChatLimitsMockHelper.generate(
          seed: seed + 'chat',
        ),
        status: UnifediApiInstanceStatusLimitsMockHelper.generate(
          seed: seed + 'status',
        ),
      );
}
