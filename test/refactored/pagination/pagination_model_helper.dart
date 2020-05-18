class TestPaginationItem {
  final int index;

  TestPaginationItem(this.index);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestPaginationItem &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return 'TestPaginationItem{index: $index}';
  }

  static int compareItems(TestPaginationItem a, TestPaginationItem b) {
    if (a == null && b == null) {
      return 0;
    }

    if (a != null && b == null) {
      return 1;
    }
    if (a == null && b != null) {
      return -1;
    }
    return a.index.compareTo(b.index) * (-1);
  }

  static bool equalItems(TestPaginationItem a, TestPaginationItem b) =>
      a.index == b.index;
}
