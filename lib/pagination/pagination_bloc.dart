import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPaginationBloc<TPage extends PaginationPage<TItem>, TItem>
    implements DisposableOwner {
  Future<TPage> getPage({@required pageIndex});

  Stream<bool> get dataInvalidatedStream;
}
