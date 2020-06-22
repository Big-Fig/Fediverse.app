import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormBloc extends DisposableOwner implements IFormBloc {
  @override
  bool get isSomethingChanged =>
      allFields.map((field) => field.isChanged).fold(false,
          (previousValue, element) {
        return previousValue | element;
      });

  @override
  Stream<bool> get isSomethingChangedStream => Rx.combineLatestList(
        allFields.map((field) => field.isChangedStream)
      ).map((isChangedList) =>
          isChangedList.fold(false, (previousValue, element) {
            return previousValue | element;
          }));
}
