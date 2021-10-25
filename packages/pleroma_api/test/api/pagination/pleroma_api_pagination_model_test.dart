import 'package:fediverse_api_test_utils/fediverse_api_test_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/src/api/pagination/pleroma_api_pagination_model_impl.dart';
import 'package:pleroma_api/src/api/pagination/pleroma_api_pagination_model_impl_mock_helper.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiPagination equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      PleromaApiPaginationMockHelper.generate,
    );
  });

  test('PleromaApiPagination toQueryArgs', () async {
    int? limit;
    String? maxId;
    String? minId;
    String? sinceId;
    var request = PleromaApiPagination(
      limit: limit,
      maxId: maxId,
      minId: minId,
      sinceId: sinceId,
    );

    expect(request.toQueryArgs().length, 0);

    limit = 1;
    maxId = 'maxId';
    minId = 'minId';
    sinceId = 'sinceId';

    request = PleromaApiPagination(
      limit: limit,
      maxId: maxId,
      minId: minId,
      sinceId: sinceId,
    );

    expect(request.toQueryArgs().length, 4);
  });
}
