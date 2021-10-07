import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'repository_model.freezed.dart';

@freezed
class RepositoryPagination<T> with _$RepositoryPagination<T> {
  const RepositoryPagination._();
  const factory RepositoryPagination({
    T? newerThanItem,
    T? olderThanItem,
    int? limit,
    int? offset,
  }) = _RepositoryPagination<T>;
}

abstract class RepositoryOrderingTerm {
  moor.OrderingMode get orderingMode;

  const RepositoryOrderingTerm();
}
