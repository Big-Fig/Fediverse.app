import 'package:fedi/ui/form/form_bloc.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/form_group_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormBloc extends FormGroupBloc implements IFormBloc {
  @override
  bool get isReadyToSubmit => !isHaveAtLeastOneError && isSomethingChanged;

  @override
//  Stream<bool> get isReadyToSubmitStream => isSomethingChangedStream;
  Stream<bool> get isReadyToSubmitStream => Rx.combineLatest2(
      isHaveAtLeastOneErrorStream,
      isSomethingChangedStream,
      (isHaveAtLeastOneError, isSomethingChanged) =>
          !isHaveAtLeastOneError && isSomethingChanged).asBroadcastStream();

  BehaviorSubject<List<IFormItemBloc>> itemsSubject = BehaviorSubject();

  FormBloc() {
    addDisposable(subject: itemsSubject);
    onItemsChanged();
  }

  @override
  Stream<List<IFormItemBloc>> get itemsStream => itemsSubject.stream;

  @override
  List<IFormItemBloc> get items => itemsSubject.value;

  List<IFormItemBloc> get currentItems;

  void onItemsChanged() {
    itemsSubject.add(currentItems);
  }

  @override
  void clear() {
    for (var item in items) {
      item.clear();
    }
  }
}
