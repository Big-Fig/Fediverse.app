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
}
