import 'package:fedi/form/form_bloc.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/form_group_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';

abstract class FormBloc extends FormGroupBloc implements IFormBloc {
  BehaviorSubject<List<IFormItemBloc>> itemsSubject = BehaviorSubject();

  FormBloc({
    required bool isAllItemsInitialized,
  }) {
    itemsSubject.disposeWith(this);

    if (isAllItemsInitialized) {
      onFormItemsChanged();
    }
  }

  @override
  Stream<List<IFormItemBloc>> get itemsStream => itemsSubject.stream;

  @override
  List<IFormItemBloc> get items => itemsSubject.value;

  List<IFormItemBloc> get currentItems;

  void onFormItemsChanged() {
    itemsSubject.add(currentItems);
  }

  @override
  void clear() {
    for (var item in items) {
      item.clear();
    }
  }
}
