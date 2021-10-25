import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

abstract class FormItemBloc extends DisposableOwner implements IFormItemBloc {
  @override
  bool get isHaveAtLeastOneError => errors.isNotEmpty;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream => errorsStream.map(
        (errors) => errors.isNotEmpty,
      );
}
