import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json/json_test_helper.dart';
import '../../../obj/obj_test_helper.dart';
import 'mastodon_api_application_test_helper.dart';

void main() {
  test(
    'MastodonApiApplicationRegistrationRequest equal & hashcode & toString',
    () async {
      ObjTestHelper.testEqualsHashcodeToString(
        ({
          required String seed,
        }) =>
            MastodonApiApplicationTestHelper
                .createTestMastodonApiApplicationRegistrationRequest(
          seed: seed,
        ),
      );
    },
  );

  test('MastodonApiApplicationRegistrationRequest toJson & fromJson', () async {
    JsonTestHelper.testFromJsonToJson(
      ({required String seed}) => MastodonApiApplicationTestHelper
          .createTestMastodonApiApplicationRegistrationRequest(
        seed: seed,
      ),
      MastodonApiApplicationRegistrationRequest.fromJson,
    );
  });
}
