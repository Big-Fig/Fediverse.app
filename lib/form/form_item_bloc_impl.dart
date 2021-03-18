import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/form/form_item_bloc.dart';

abstract class FormItemBloc extends DisposableOwner implements IFormItemBloc {
  @override
  bool get isHaveAtLeastOneError => errors.isNotEmpty == true;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream => errorsStream.map(
        (errors) => errors.isNotEmpty == true,
      );
}
