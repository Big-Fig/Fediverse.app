import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../obj/obj_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) => RepositoryPagination(
        newerThanItem: seed + '1',
        olderThanItem: seed + '2',
        limit: seed.hashCode % 5,
        offset: seed.hashCode % 3,
      ),
    );
  });
}
