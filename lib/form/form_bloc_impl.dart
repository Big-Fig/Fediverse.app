import 'package:fedi/form/form_bloc.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/form_group_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormBloc extends FormGroupBloc implements IFormBloc {
  @override
  bool get isHaveChangesAndNoErrors =>
      !isHaveAtLeastOneError && isSomethingChanged;

  @override
//  Stream<bool> get isReadyToSubmitStream => isSomethingChangedStream;
  Stream<bool> get isHaveChangesAndNoErrorsStream => Rx.combineLatest2(
      isHaveAtLeastOneErrorStream,
      isSomethingChangedStream,
      (bool isHaveAtLeastOneError, bool isSomethingChanged) =>
          !isHaveAtLeastOneError && isSomethingChanged).asBroadcastStream();

  BehaviorSubject<List<IFormItemBloc>> itemsSubject = BehaviorSubject();

  FormBloc({
    required bool isAllItemsInitialized,
  }) {
    addDisposable(subject: itemsSubject);
    if (isAllItemsInitialized) {
      onFormItemsChanged();
    }
  }

  @override
  Stream<List<IFormItemBloc>> get itemsStream => itemsSubject.stream;

  @override
  List<IFormItemBloc> get items => itemsSubject.value!;

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
