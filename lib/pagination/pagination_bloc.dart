import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPaginationBloc<T> implements DisposableOwner {
  Future<PaginationPage<T>> getPage({@required pageIndex});
  Stream<bool> get dataInvalidatedStream;
}
