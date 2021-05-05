import 'package:fedi/obj/equal_comparable_obj.dart';

class PaginationItemTest implements IEqualComparableObj<PaginationItemTest> {
  final int index;

  PaginationItemTest(this.index);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationItemTest &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return 'TestPaginationItem{index: $index}';
  }

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
