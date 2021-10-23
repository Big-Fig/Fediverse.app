import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model_test_impl.freezed.dart';

@freezed
class PaginationItemTest
    with _$PaginationItemTest
    implements IEqualComparableObj<PaginationItemTest> {
  const PaginationItemTest._();

  const factory PaginationItemTest(int index) = _PaginationItemTest;

  static int compareItems(PaginationItemTest? a, PaginationItemTest? b) {
    if (a == null && b == null) {
      return 0;
    } else if (a != null && b == null) {
      return 1;
    } else if (a == null && b != null) {
      return -1;
    } else {
      return a!.index.compareTo(b!.index) * (-1);
    }
  }

  static bool equalItems(PaginationItemTest a, PaginationItemTest b) =>
      a.index == b.index;

  @override
  int compareTo(PaginationItemTest b) => compareItems(this, b);

  @override
  bool isEqualTo(PaginationItemTest b) => equalItems(this, b);
}
