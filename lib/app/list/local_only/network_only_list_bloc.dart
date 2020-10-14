import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

abstract class ILocalOnlyListBloc<T> extends DisposableOwner {
  Future<List<T>> loadItemsFromLocalForPage({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required T olderThan,
    @required T newerThan,
  });
}
