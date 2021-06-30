import 'package:easy_dispose/easy_dispose.dart';

abstract class ILocalOnlyListBloc<T> extends DisposableOwner {
  Future<List<T>> loadItemsFromLocalForPage({
    required int? pageIndex,
    required int? itemsCountPerPage,
    required T? olderThan,
    required T? newerThan,
  });
}
