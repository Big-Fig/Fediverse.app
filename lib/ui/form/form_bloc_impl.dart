import 'package:fedi/ui/form/form_bloc.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/form_group_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormBloc extends FormGroupBloc implements IFormBloc {
  @override
  bool get isReadyToSubmit =>
      !isHaveAtLeastOneError &&
          isSomethingChanged;
  @override
//  Stream<bool> get isReadyToSubmitStream => isSomethingChangedStream;
  Stream<bool> get isReadyToSubmitStream => Rx.combineLatest2(
      isHaveAtLeastOneErrorStream,
      isSomethingChangedStream,
      (isHaveAtLeastOneError, isSomethingChanged) =>
          !isHaveAtLeastOneError &&
              isSomethingChanged
  );

  @override
  Stream<List<IFormItemBloc>> get itemsStream => Stream.value(items);
}
