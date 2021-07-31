import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/test/pagination/pleroma_api_pagination_test_helper.dart';
import 'package:test/test.dart';

import '../../../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('PleromaApiPagination equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          PleromaApiPaginationTestHelper.createTestPleromaApiPaginationRequest(
        seed: seed,
      ),
    );
  });

  test('PleromaApiPagination toQueryArgs', () async {
    int? limit;
    String? maxId;
    String? minId;
    String? sinceId;
    var request = PleromaApiPaginationRequest(
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

    request = PleromaApiPaginationRequest(
      limit: limit,
      maxId: maxId,
      minId: minId,
      sinceId: sinceId,
    );

    expect(request.toQueryArgs().length, 4);
  });
}
