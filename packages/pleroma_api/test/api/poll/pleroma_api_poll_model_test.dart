import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:pleroma_api/src/api/poll/option/pleroma_api_poll_option_model_impl.dart';
import 'package:pleroma_api/src/api/poll/pleroma_api_poll_model_impl.dart';
import 'package:pleroma_api/src/api/poll/pleroma_api_poll_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiPoll equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiPollMockHelper.generate,
    );
  });

  test('PleromaApiPoll toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      PleromaApiPollMockHelper.generate,
      (json) => PleromaApiPoll.fromJson(json),
    );
  });
  test(
    'PleromaApiPollOption toPleromaApiPollOptionTitles',
    () async {
      expect(
        const [
          PleromaApiPollOption(
            title: 'title1',
            votesCount: 0,
          ),
          PleromaApiPollOption(
            title: 'title2',
            votesCount: 0,
          ),
        ].toPleromaApiPollOptionTitles(),
        [
          'title1',
          'title2',
        ],
      );
    },
  );
}
