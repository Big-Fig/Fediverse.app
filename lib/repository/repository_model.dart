import 'package:moor/moor.dart';

class RepositoryPagination<T> {
  final T? newerThanItem;
  final T? olderThanItem;
  final int? limit;
  final int? offset;

  RepositoryPagination({
    this.newerThanItem,
    this.olderThanItem,
    this.limit,
    this.offset,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryPagination &&
          runtimeType == other.runtimeType &&
          newerThanItem == other.newerThanItem &&
          olderThanItem == other.olderThanItem &&
          limit == other.limit &&
          offset == other.offset;

  @override
  int get hashCode =>
      newerThanItem.hashCode ^
      olderThanItem.hashCode ^
      limit.hashCode ^
      offset.hashCode;

  @override
  String toString() {
    return 'RepositoryPagination{'
        'newerThanItem: $newerThanItem,'
        ' olderThanItem: $olderThanItem,'
        ' limit: $limit,'
        ' offset: $offset'
        '}';
  }
}

abstract class RepositoryOrderingTerm {
  OrderingMode get orderingMode;

  const RepositoryOrderingTerm();
}
